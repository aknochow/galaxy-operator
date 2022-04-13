FROM quay.io/operator-framework/ansible-operator:v1.12.0

ENV ANSIBLE_FORCE_COLOR=true
ENV ANSIBLE_SHOW_TASK_PATH_ON_FAILURE=true

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
