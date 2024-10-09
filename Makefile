usage:
	@echo "Available commands: "
	@echo
	@echo =========================================================
	@echo "\t\033[92mhelp\033[0m - Show help."
	@echo "\t\033[92minit_tf\033[0m - Prepare stack for deploy to the gcp."
	@echo "\t\033[92mplan_tf\033[0m - Plan stack for deploy to the gcp."
	@echo "\t\033[92mapply_tf\033[0m - Apply stack for deploy to the gcp."
	@echo "\t\033[92mdestroy_tf\033[0m - Destroy stack for deploy to the gcp."
	@echo
	@echo =========================================================
	@echo

# ---------------------------------------------------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------------------------------------------------

REQUIRED_BINS := docker kubectl terraform helm gcloud

# ---------------------------------------------------------------------------------------------------------------------
# Targets
# ---------------------------------------------------------------------------------------------------------------------

.PHONY: usage
.PHONY: help
help: usage

.PHONY: check_bin
check_bin:
	$(foreach bin,$(REQUIRED_BINS),\
	    $(if $(shell command -v $(bin) 2> /dev/null),\
	    $(info Found `$(bin)`),\
	    $(error Please install `$(bin)`)))

.PHONY: init_tf
init_tf:
	@make \
		check_bin
	@echo "\t\033[92mInit terraform\033[0m"
	@terraform -chdir=terraform init

.PHONY: plan_tf
plan_tf:
	@echo "\t\033[92mInit terraform\033[0m"
	@terraform -chdir=terraform plan

.PHONY: apply_tf
apply_tf:
	@echo "\t\033[92mInit terraform\033[0m"
	@terraform -chdir=terraform apply

.PHONY: destroy_tf
destroy_tf:
	@echo "\t\033[92mInit terraform\033[0m"
	@terraform -chdir=terraform destroy

