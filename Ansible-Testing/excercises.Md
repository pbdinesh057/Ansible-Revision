# Ansible Revision: 10 Hands-On Exercises for Job & Interview Prep

This repository contains 10 practical Ansible exercises designed to help you revise key concepts from both a job and interview perspective. These exercises are aligned with real-world use cases, common interview topics, and best practices.

---

## ✅ How to Use
- Complete one exercise per session/day.
- Keep track of your progress by checking off tasks.
- Extend and experiment with each playbook to solidify your understanding.

---

## 📘 Prerequisites
- Ansible installed on a control node
- At least one target node (can be localhost or remote VM)
- Basic understanding of Linux and YAML

---

## 🧩 Exercises

### 1. **Inventory Mastery**
**Goal:** Define and use static and dynamic inventories.
- [ ] Create a static inventory with multiple groups (web, db).
- [ ] Use group_vars and host_vars to define variables.
- [ ] Set up a simple dynamic inventory using a script or plugin.

### 2. **Playbook Basics**
**Goal:** Write a multi-task playbook.
- [ ] Install Apache/Nginx using a playbook.
- [ ] Ensure service is started and enabled.
- [ ] Use handlers for restarting.

### 3. **Variables & Facts**
**Goal:** Understand variable precedence and facts.
- [ ] Use `ansible_facts` to gather OS info.
- [ ] Define variables at various levels: inventory, command-line, playbook.
- [ ] Use `debug` to print variable values.

### 4. **Conditionals and Loops**
**Goal:** Implement control logic.
- [ ] Install packages only on Ubuntu hosts.
- [ ] Use `with_items` or `loop` to create users.
- [ ] Use `when` and `register` together for idempotency.

### 5. **Templates & Jinja2**
**Goal:** Use templates for dynamic configs.
- [ ] Create a `nginx.conf.j2` or `index.html.j2` file.
- [ ] Render it using the `template` module.
- [ ] Add conditional logic or loops in the template.

### 6. **Roles & Reusability**
**Goal:** Structure reusable Ansible code.
- [ ] Create a role for Apache or Nginx.
- [ ] Use `defaults`, `vars`, and `handlers` folders.
- [ ] Use this role in a playbook.

### 7. **Tags & Error Handling**
**Goal:** Speed up and control playbook execution.
- [ ] Tag specific tasks (e.g., install, config, restart).
- [ ] Use `block`, `rescue`, and `always` for error handling.

### 8. **Ansible Vault**
**Goal:** Secure sensitive data.
- [ ] Create a vault-encrypted variable file for passwords.
- [ ] Use `--ask-vault-pass` or `--vault-password-file`.
- [ ] Combine with templates or playbooks.

### 9. **Custom Modules & Filters**
**Goal:** Extend Ansible’s functionality.
- [ ] Write a simple custom module in Python.
- [ ] Use `set_fact` with filters to manipulate data.
- [ ] Try a community module from Ansible Galaxy.

### 10. **Real-World Project: LAMP Stack Deployment**
**Goal:** Combine all learnings into a single project.
- [ ] Use roles: apache, mysql, php.
- [ ] Use templates for config files.
- [ ] Use vault for credentials.
- [ ] Use tags and handlers effectively.

---

## 📌 Bonus: Interview Prep Questions
- What’s the difference between `vars` and `defaults`?
- How does Ansible differ from Terraform?
- What happens if a playbook fails mid-way?
- How would you organize Ansible for managing 100+ servers?

---

## 🗂 Folder Structure Suggestion
```bash
.
├── inventory/
├── group_vars/
├── host_vars/
├── roles/
│   ├── apache/
│   ├── mysql/
│   └── php/
├── templates/
├── playbooks/
│   ├── 01_inventory.yml
│   ├── 02_playbook_basics.yml
│   └── ...
└── vault/
```

---

## 🚀 Tips
- Use `ansible-lint` to catch syntax/best-practice issues.
- Use GitHub issues or projects to track completion.
- Push your playbooks here for version control and reference.

Happy Automating! ✨

