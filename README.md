<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="100%" />

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.10%2B-green?style=for-the-badge&logo=neovim" />
  <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua" />
  <img src="https://img.shields.io/badge/OpenCode-FF6F00?style=for-the-badge&logo=openai" />
</p>

<h1 align="center">✨ Neovim Config — с душой и OpenCode</h1>

<p align="center">
  Красивая, функциональная конфигурация Neovim для комфортной разработки.<br />
  С интегрированным OpenCode для AI-помощи прямо в редакторе.
</p>

<p align="center">
  <a href="#-установка">Установка</a> •
  <a href="#-opencode-интеграция">OpenCode</a> •
  <a href="#-сочетания-клавиш">Хоткеи</a> •
  <a href="#-плагины">Плагины</a> •
  <a href="#-структура">Структура</a>
</p>

---

## 📦 Установка

### 1. Клонировать репозиторий

```bash
git clone https://github.com/514dotcom/nvim-config.git ~/.config/nvim
```

### 2. Установить Neovim

```bash
brew install neovim
```

### 3. Установить OpenCode (рекомендуется)

```bash
curl -fsSL https://opencode.ai/install.sh | sh
```

### 4. Запустить Neovim

```bash
nvim
```

Плагины установятся автоматически через `lazy.nvim`. LSP-серверы — через `Mason` при открытии файлов.

> **Важно**: Если плагины не установились — закрой Neovim, удали `~/.local/share/nvim/lazy` и открой заново.

---

## 💬 OpenCode Интеграция

OpenCode запускается в **вертикальном сплите справа** (35% ширины экрана) через `opencode mini`.

### Горячие клавиши для OpenCode

| Клавиша        | Действие                                         |
|----------------|--------------------------------------------------|
| `<leader>ao`   | Открыть/закрыть OpenCode чат справа              |
| `<leader>ac`   | Открыть OpenCode с контекстом текущего файла     |
| `<leader>at`   | Обычный терминал (снизу)                         |
| `<leader>af`   | Плавающий терминал                               |

> `<leader>` = **Пробел**

### Использование

1. Открой Neovim: `nvim`
2. Нажми `Space` → `a` → `o` — справа откроется `opencode mini`
3. Пиши промты прямо в терминале OpenCode
4. Нажми `Esc` чтобы выйти из режима вставки в терминале
5. Используй `Ctrl+h` / `Ctrl+l` для переключения между окнами

> **Совет**: Команда `:OpenCodeToggle` делает то же самое, что и хоткей.

---

## ⌨️ Сочетания клавиш

### Навигация

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `Ctrl + h/j/k/l` | Навигация между окнами       |
| `Ctrl + ←/→`  | Изменить ширину окна            |
| `Ctrl + ↑/↓`  | Изменить высоту окна            |

### Поиск (Telescope)

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `<leader>ff`  | Найти файлы (Fuzzy Find)        |
| `<leader>fg`  | Поиск по тексту (Live Grep)     |
| `<leader>fb`  | Поиск по буферам                |
| `<leader>fh`  | Поиск по справке (help tags)    |
| `<leader>fo`  | Недавние файлы                  |
| `<leader>fz`  | Поиск по текущему файлу         |
| `<leader>fc`  | Поиск по командам               |
| `<leader>fk`  | Показать все хоткеи             |
| `<leader>fs`  | Символы (Treesitter)            |
| `<leader>fw`  | Поиск слова под курсором        |
| `<leader>st`  | Найти TODO-комментарии          |

### LSP (языковой сервер)

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `gd`          | Перейти к определению           |
| `gD`          | Перейти к объявлению            |
| `gi`          | Найти реализации                |
| `go`          | Перейти к типу                  |
| `gr`          | Найти все ссылки                |
| `K`           | Показать документацию           |
| `Ctrl + k`    | Показать сигнатуру функции      |
| `<leader>ca`  | Code Actions (исправления)      |
| `<leader>rn`  | Переименовать                   |
| `<leader>d`   | Показать диагностику            |
| `[d` / `]d`   | Предыдущая / следующая ошибка   |

### Файловое дерево (Neo-tree)

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `<leader>e`   | Открыть/закрыть файловое дерево |
| `<leader>ef`  | Сфокусироваться на дереве       |
| `<leader>eb`  | Показать буферы в дереве        |
| `<leader>eg`  | Показать git статус в дереве    |
| `<leader>er`  | Показать текущий файл в дереве  |

Внутри дерева:

| Клавиша | Действие |
|---------|----------|
| `o` / `Enter` | Открыть файл |
| `s` | Открыть в вертикальном сплите |
| `S` | Открыть в произвольном сплите |
| `t` | Открыть в новой вкладке |
| `a` | Создать файл/папку |
| `d` | Удалить |
| `r` | Переименовать |
| `y` | Копировать |
| `x` | Вырезать |
| `p` | Вставить |
| `H` | Показать скрытые файлы |
| `R` | Обновить |

### Lint (проверка кода)

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `<leader>ll`  | Включить/выключить линтер       |

Линтер автоматически проверяет код при сохранении файла. Поддерживаются:
Python (pylint, ruff), JavaScript/TypeScript (eslint), Lua (selene), Go (golangci-lint), Rust (clippy), CSS (stylelint), Shell (shellcheck) и другие.

### Git (gitsigns)

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `]c` / `[c`   | Следующий / предыдущий hunk     |
| `<leader>ghs` | Stage hunk (добавить в коммит)  |
| `<leader>ghr` | Reset hunk (откатить)           |
| `<leader>ghS` | Stage весь буфер                |
| `<leader>ghp` | Preview hunk                    |
| `<leader>ghb` | Показать blame                  |
| `<leader>ghd` | Сравнить с HEAD                 |

### Буферы и окна

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `Tab` / `Shift+Tab` | Следующий / предыдущий буфер |
| `<leader>bd`  | Закрыть буфер                   |
| `<leader>ba`  | Закрыть все буферы              |
| `<leader>tt`  | Новая вкладка (tab)             |
| `<leader>tn`  | Следующая вкладка               |
| `<leader>tp`  | Предыдущая вкладка              |

### Редактирование

| Клавиша       | Действие                        |
|---------------|---------------------------------|
| `gcc`         | Закомментировать строку         |
| `gbc`         | Закомментировать блок           |
| `J` / `K`     | Переместить строку вниз/вверх   |
| `<leader>w`   | Сохранить файл                  |
| `<leader>q`   | Закрыть окно                    |

---

## 🎨 Внешний вид

- **Тема**: [Catppuccin Mocha](https://github.com/catppuccin/nvim) — тёплая тёмная тема
- **Статусная строка**: [Lualine](https://github.com/nvim-lualine/lualine.nvim) — информативная и красивая
- **Вкладки**: [Bufferline](https://github.com/akinsho/bufferline.nvim) — стильные вкладки сверху
- **Отступы**: [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) — направляющие линии
- **Уведомления**: [Noice](https://github.com/folke/noice.nvim) — красивые попапы
- **Приветствие**: [Alpha](https://github.com/goolord/alpha-nvim) — экран-дашборд со ссылками

---

## 🔌 Плагины

| Плагин | Назначение |
|--------|------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Менеджер плагинов |
| [Catppuccin](https://github.com/catppuccin/nvim) | Цветовая тема |
| [Lualine](https://github.com/nvim-lualine/lualine.nvim) | Статусная строка |
| [Bufferline](https://github.com/akinsho/bufferline.nvim) | Вкладки |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Поиск всего |
| [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Подсветка синтаксиса |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP клиент |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Автокомплит |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Сниппеты |
| [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) | Терминал (OpenCode) |
| [Which-Key](https://github.com/folke/which-key.nvim) | Подсказки клавиш |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git в гутере |
| [Noice](https://github.com/folke/noice.nvim) | Уведомления |
| [Alpha](https://github.com/goolord/alpha-nvim) | Приветствие |
| [Comment](https://github.com/numToStr/Comment.nvim) | Комментарии |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Автозакрытие скобок |
| [Todo Comments](https://github.com/folke/todo-comments.nvim) | TODO-комментарии |
| [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Отступы |
| [Mason](https://github.com/williamboman/mason.nvim) | Установщик LSP |
| [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | Файловое дерево |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Линтер |
| [Rainbow Delimiters](https://github.com/hiphish/rainbow-delimiters.nvim) | Разноцветные скобки |

---

## 📁 Структура

```
~/.config/nvim/
├── init.lua                    # Главный файл
├── .gitignore
├── README.md
└── lua/
    ├── core/
    │   ├── options.lua         # Опции Neovim
    │   ├── keymaps.lua         # Глобальные хоткеи
    │   └── lazy.lua            # lazy.nvim загрузчик
    └── plugins/
        ├── init.lua            # Список плагинов
        ├── colorscheme.lua     # Catppuccin тема
        ├── lualine.lua         # Статусная строка
        ├── bufferline.lua      # Вкладки
        ├── indent-blankline.lua # Отступы
        ├── noice.lua           # Уведомления
        ├── alpha.lua           # Приветственный экран
        ├── which-key.lua       # Подсказки
        ├── comment.lua         # Комментарии
        ├── autopairs.lua       # Автозакрытие
        ├── todo-comments.lua   # TODO-комментарии
        ├── treesitter.lua      # Treesitter
        ├── lsp.lua             # LSP конфигурация
        ├── cmp.lua             # Автокомплит
        ├── lspkind.lua         # Иконки для автокомплита
        ├── telescope.lua       # Поиск
        ├── gitsigns.lua        # Git
        ├── toggleterm.lua      # OpenCode терминал
        ├── mason.lua           # Установщик LSP
        ├── neo-tree.lua        # Файловое дерево
        └── lint.lua            # Линтер
```

---

## 🛠️ Настройка под себя

### Изменить тему

В `lua/plugins/colorscheme.lua` можно сменить flavour:

```lua
flavour = "mocha",  -- варианты: latte, frappe, macchiato, mocha
```

### Добавить LSP-сервер

В `lua/plugins/lsp.lua` добавь в `opts.servers`:

```lua
rust_analyzer = {},
```

### Сменить размер OpenCode панели

В `lua/plugins/toggleterm.lua`:

```lua
size = function(term)
  if term.direction == "vertical" then
    return vim.o.columns * 0.35  -- 35% ширины
  end
end,
```

---

## 📜 Лицензия

MIT © [514dotcom](https://github.com/514dotcom)