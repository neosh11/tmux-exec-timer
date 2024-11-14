# Makefile

.PHONY: install test lint

install:
    bash install.sh

test:
    bash tests/test_timer.sh
    bash tests/test_utils.sh

lint:
    bash scripts/lint.sh
