# 🔒 Linux Hardening Scanner

A lightweight Bash-based security scanner that performs essential Linux hardening checks.

This project was built to practice Linux administration, Bash scripting, and basic security auditing by checking common system misconfigurations.

---

## ✨ Features

### 👤 User Checks

- Detect multiple users with **UID 0**
- Detect users **without passwords**
- Detect system users with **interactive login shells**

---

### 🔐 Permission Checks

Checks the permissions of:

- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`
- `/etc/sudoers`

---

### 🛡️ Sudo Checks

- Verify `/etc/sudoers` permissions
- Verify files inside `/etc/sudoers.d`
- Detect **NOPASSWD** sudo rules

---

## 📁 Project Structure

```text
Linux-Hardening-Scanner/
│
├── scanner.sh
├── config.sh
├── README.md
│
├── lib/
│   ├── users.sh
│   ├── permissions.sh
│   ├── sudo.sh
│   └── report.sh
```

---

## 🚀 Usage

Clone the repository:

```bash
git clone git@github.com:SilentSpectre-arch/Linux-Hardening-Scanner.git
cd Linux-Hardening-Scanner
```

Make the scanner executable:

```bash
chmod +x scanner.sh
```

Run the scanner as root:

```bash
sudo ./scanner.sh
```

---

## 📋 Example Output

```text
========================================
        Linux Hardening Scanner
========================================

[OK] Only root has UID 0

[WARNING] Found 1 user without a password

Users:
test

[OK] No system users have interactive shells

[OK] /etc/passwd permission is correct (644)

[OK] /etc/shadow permission is correct (600)

[WARNING] /etc/sudoers permission is incorrect

Current : 644
Expected: 440

[OK] No NOPASSWD entries found
```


---

## 🛠️ Requirements

- Linux
- Bash 4+
- Root privileges
- Standard GNU utilities

---



## 📄 License

This project is licensed under the MIT License.

---

## ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub.

Happy Hardening! 🔒