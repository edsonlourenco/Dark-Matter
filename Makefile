AIRFLOW_UID ?= 50000
COMPOSE_FILES := $(shell find services -name 'docker-compose-*.yaml' | sort)
SERVICES := $(shell echo "$(COMPOSE_FILES)" | sed -E 's|services/(.*)/docker-compose-\1.yaml|\1|' | sort)

.PHONY: default ensure-network up down ps reset clean-var

default: up

ensure-network:
	@echo "🔗 Checking for Docker network 'dark-matter-network'..."
	@if ! docker network ls | grep -q 'dark-matter-network'; then \
		echo "🔧 Creating network 'dark-matter-network'..."; \
		docker network create dark-matter-network; \
	else \
		echo "✅ Network 'dark-matter-network' already exists."; \
	fi

up: ensure-network
	@echo "🚀 Starting service(s): $(SERVICES)"
	AIRFLOW_UID=$(AIRFLOW_UID) docker compose \
		$(foreach file,$(COMPOSE_FILES),-f $(file)) \
		up --build -d

down:
	@echo "🛑 Stopping service(s): $(SERVICES)"
	docker compose \
		$(foreach file,$(COMPOSE_FILES),-f $(file)) \
		down

ps:
	@echo "🔍 Listing containers for: $(SERVICES)"
	docker compose \
		$(foreach file,$(COMPOSE_FILES),-f $(file)) \
		ps

reset:
	@echo "⚠️  Resetting full environment..."
	@echo "🧹 Stopping all containers defined for: $(SERVICES)"
	@$(foreach file,$(COMPOSE_FILES), \
		echo "🔻 Stopping services from $(file)..."; \
		docker compose -f $(file) down --volumes --remove-orphans || true;)
	@echo "🧼 Removing 'dark-matter-network' if it exists..."
	-docker network rm dark-matter-network 2>/dev/null || true
	@echo "✅ Reset complete."

clean-var:
	@echo "🧽 Checking for running service containers..."
	@if docker ps --format '{{.Names}}' | grep -qE 'airflow-|postgres|spark|minio|jupyter'; then \
		echo "⚠️ Cannot clean 'var/' while service containers are running."; \
		echo "🛑 Please stop all containers first using: make down"; \
		exit 1; \
	else \
		echo "🧹 Cleaning up project 'var/' directory..."; \
		find var/ -mindepth 1 -exec rm -rf {} +; \
		echo "✅ 'var/' has been cleaned."; \
	fi

# ℹ️ Examples:
# make up SERVICES="minio spark"make dow
# make down SERVICES="spark minio"
# make ps SERVICES="airflow"
# make reset SERVICES="minio spark airflow"
# make clean-var