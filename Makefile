.PHONY: install test
PROJECT=device_picker
TESTDIR=tmp-test-dir-with-unique-name
PYTEST_ARGS=--cov-config=../.coveragerc --cov-report=term-missing --cov=$(PROJECT) -v --pyargs

# Set the default target to 'help' so it will list available commands
help:
	@echo "Available commands:"
	@echo "  install    Install the package and its dependencies"
	@echo "  test       Run unit tests"
	@echo "  clean      Run cleaning"
	@echo "  build      Build the package"

# Installation command
install:
	pip install .

test:
	# Run a tmp folder to make sure the tests are run on the installed version
	python -m pip install pytest -q
	mkdir -p $(TESTDIR)
	cd $(TESTDIR); pytest ../unit_test/tests.py
	rm -r $(TESTDIR)

clean:
	find . -name "*.pyc" -exec rm -v {} \;
	find . -name "*.orig" -exec rm -v {} \;
	find . -name ".coverage.*" -exec rm -v {} \;
	find . -name ".DS_Store" -exec rm -v {} \;
	rm -rvf build dist MANIFEST *.egg-info __pycache__ .coverage .cache .pytest_cache $(PROJECT)/_version.py
	rm -rvf $(TESTDIR) dask-worker-space

build:
	pip install build
	python -m build