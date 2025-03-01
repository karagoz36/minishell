# 📌 Minishell - A Simple Shell Implementation

Minishell is a **minimalistic shell** project developed as part of the **42 school curriculum**. The goal is to **replicate a basic UNIX shell**, handling **command execution, pipes, redirections, and environment variables**, while deepening knowledge of **processes, system calls, and signals** in C.

---

## 🚀 Features
- **Prompt & Command Execution**: Runs system commands similar to Bash.
- **Built-in Commands**: Implements `echo`, `cd`, `pwd`, `export`, `unset`, `env`, and `exit`.
- **Pipes & Redirections**: Supports `|`, `<`, `>` for process chaining and file I/O.
- **Environment Variables**: Handles `$VARIABLES` expansion.
- **Signal Handling**: Correctly processes `Ctrl+C`, `Ctrl+D`, and `Ctrl+\`.
- **Exit Status Management**: Preserves last command's return status.

---

## 🛠️ Tech Stack
| Category       | Technologies Used |
|---------------|------------------|
| **Language**  | C |
| **Libraries** | readline, termcap |
| **System Calls** | fork, execve, waitpid, pipe, dup2, signals |

---

## 📝 Installation & Setup
### 📂 1️⃣ Clone the Repository
```sh
git clone https://github.com/karagoz36/minishell.git
cd minishell
```

### 🔧 2️⃣ Build the Project
```sh
make
```

### 🎮 3️⃣ Run the Shell
```sh
./minishell
```

---

## 📈 Shell Features
### Built-in Commands:
| Command  | Description |
|----------|------------|
| `echo`   | Prints arguments to stdout. Supports `-n` flag. |
| `cd`     | Changes directory. |
| `pwd`    | Prints current working directory. |
| `export` | Sets environment variables. |
| `unset`  | Removes environment variables. |
| `env`    | Prints current environment variables. |
| `exit`   | Exits the shell. |

### Pipes & Redirections:
```sh
echo "Hello" | cat -e  # Piping example
ls > file.txt          # Output redirection
cat < file.txt         # Input redirection
ls >> file.txt         # Append output
```

### Signal Handling:
- `Ctrl+C`: Kills the current process but keeps shell running.
- `Ctrl+D`: Exits the shell.
- `Ctrl+\`: Does nothing (ignored for interactive mode).

---

## 💡 Notes
- **Does not support advanced shell features like job control (`fg`, `bg`).**
- **Handles errors gracefully and mimics Bash behavior.**
- **Designed to be a foundational shell project for deeper system programming exploration.**

---

