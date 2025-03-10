#!/bin/bash
#################################################
# Modern Terraform Static Testing Script
#################################################

#------------------------------------------------
# SETUP
#------------------------------------------------
# Set default directory to test if not provided
TF_DIR=${1:-"../infrastructure/dev/s3"}

# Log function (stdout only)
log() {
  echo -e "[$(date +"%H:%M:%S")] $1"
}

log "RUNNING MODERN TERRAFORM TESTS ON: $TF_DIR"

# Change to the target directory
if [ ! -d "$TF_DIR" ]; then
  log "❌ Error: Directory $TF_DIR does not exist"
  exit 1
fi

#------------------------------------------------
# 1. TERRAFORM BUILT-IN TESTS
#------------------------------------------------
log "\n--- TERRAFORM BUILT-IN TESTS ---"

# Format check the entire infrastructure directory to catch all files
log "Checking Terraform formatting..."
terraform fmt -check -recursive infrastructure/
FMT_RESULT=$?
[ $FMT_RESULT -eq 0 ] && log "✅ Format check passed" || log "❌ Format check failed"

# Run tests in the target directory
cd "$TF_DIR" || exit 1
log "Running tests in $(pwd)"

# Initialize Terraform
log "Initializing Terraform..."
terraform init -backend=false
INIT_RESULT=$?
[ $INIT_RESULT -eq 0 ] && log "✅ Init passed" || log "❌ Init failed"

# Validate Terraform
log "Validating Terraform configuration..."
terraform validate
VALIDATE_RESULT=$?
[ $VALIDATE_RESULT -eq 0 ] && log "✅ Validate passed" || log "❌ Validate failed"

#------------------------------------------------
# 2. TFLINT (ADVANCED LINTING)
#------------------------------------------------
log "\n--- TFLINT ADVANCED LINTING ---"

tflint --recursive || true
TFLINT_RESULT=$?
[ $TFLINT_RESULT -eq 0 ] && log "✅ TFLint passed" || log "❌ TFLint found issues"

#------------------------------------------------
# 3. TRIVY (SECURITY SCANNING)
#------------------------------------------------
log "\n--- TRIVY SECURITY SCAN ---"

trivy config . || true
TRIVY_RESULT=$?
[ $TRIVY_RESULT -eq 0 ] && log "✅ Trivy security scan passed" || log "❌ Trivy found security issues"

# Return to original directory
cd - > /dev/null

#------------------------------------------------
# SUMMARY
#------------------------------------------------
# Count failed tests
FAILED=0
for RESULT in $FMT_RESULT $INIT_RESULT $VALIDATE_RESULT $TFLINT_RESULT $TRIVY_RESULT; do
  if [ "$RESULT" != "0" ]; then
    FAILED=$((FAILED+1))
  fi
done

if [ $FAILED -eq 0 ]; then
  log "\n✅ All tests passed successfully!"
else
  log "\n⚠️ $FAILED test(s) reported issues."
fi

# Return overall success/failure
exit $FAILED