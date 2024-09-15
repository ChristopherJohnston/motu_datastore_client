SRC_DIR ?= .
MYPY_DIRS := $(shell find ${SRC_DIR}/package ! -path '*.egg-info*' -type d -maxdepth 1 -mindepth 1 | xargs)

.PHONY: lint
lint:
	ruff check --target-version=py311 ${SRC_DIR}

.PHONY: lint-github
lint-github:
	ruff check --output-format=github --target-version=py311 ${SRC_DIR}

.PHONY: mypy
mypy: $(MYPY_DIRS)
	$(foreach d, $(MYPY_DIRS), python -m mypy $(d);)

.PHONY: test
test:
	pytest --cov=motu_datastore_client -v -s ${SRC_DIR}/tests

.PHONY: develop
develop:
	python -m pip install --editable ${SRC_DIR}
	python -m pip install -U -r requirements-dev.txt

.PHONY: run
run:
	./run http://localhost:8888