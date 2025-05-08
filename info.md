🔍 Step-by-Step Breakdown with Files and Flow

1️⃣
Workflow is triggered (push, pull_request, etc.)
.github/workflows/deploy.yaml
2️⃣
Workflow step uses your Docker action: uses: ITBeyder/k8s-deploy-action
deploy.yaml, the job step definition
3️⃣
GitHub fetches the action repo and reads action.yml
k8s-deploy-action/action.yml
4️⃣
Docker builds the image from Dockerfile
k8s-deploy-action/Dockerfile
5️⃣
Docker sets /entrypoint.sh as the entrypoint script
k8s-deploy-action/entrypoint.sh
6️⃣
GitHub injects with: and env: as environment variables like INPUT_COMMAND, KUBE_CONFIG_DATA
your workflow YAML + GitHub runtime
7️⃣
Inside container, entrypoint.sh decodes kubeconfig and executes command
logic inside entrypoint.sh
8️⃣
$INPUT_COMMAND is run via sh -c "$INPUT_COMMAND"
any shell-compatible string from workflow command:
9️⃣
Command output or error is shown in workflow logs
GitHub Actions runner engine
