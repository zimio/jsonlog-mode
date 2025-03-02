# jsonlog-mode

`jsonlog-mode` is an Emacs major mode designed to parse JSON logs into a format that can be understood by `logview-mode`. This allows for improved readability and structured log viewing within Emacs.

## 🚀 Features
- Converts JSON-formatted logs into a format compatible with `logview-mode`.
- Enables structured log viewing and filtering.
- Integrates seamlessly with `logview-mode` for a better log analysis experience.

## ⚠️ Early Development Notice
`jsonlog-mode` is still in early development, and features are subject to change. Expect bugs and missing functionality. Contributions and feedback are welcome!

## 📦 Requirements
- **Emacs** (version 27+ recommended)
- **logview-mode** (must be installed for `jsonlog-mode` to function correctly)

## 🔧 Installation
Currently, `jsonlog-mode` is not available via MELPA. To install manually:

1. Clone the repository:
   ```sh
   git clone https://github.com/zimio/jsonlog-mode.git
   ````
2. Add the directory to your Emacs load path:
   ```elisp
   (add-to-list 'load-path "/path/to/jsonlog-mode")
   (require 'jsonlog-mode)
   ```
3. Ensure `logview-mode` is installed and loaded in your Emacs configuration.

## Usage
To use `jsonlog-mode`, open a JSON log file and enable the mode:
```elisp
M-x jsonlog-mode
```

Ensure `logview-mode` is active to take advantage of its filtering and formatting capabilities.

## 📜 License
This project is licensed under the GPLv3 License.

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to submit a pull request or open an issue on GitHub.

## 📞 Contact
For any questions or discussions, open an issue on the repository or reach out via email.

