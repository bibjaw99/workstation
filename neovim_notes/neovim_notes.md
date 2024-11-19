# How to Automatically create a file with "gf" if it is not available, including directories

### Code:

```lua
vim.keymap.set("n", "gf", function()
    local filepath = vim.fn.expand("<cfile>")
    if vim.fn.filereadable(filepath) == 0 then
        -- Create missing directories
        vim.fn.mkdir(vim.fn.fnamemodify(filepath, ":h"), "p")
        -- Create and open the file
        vim.cmd("edit " .. filepath)
        print("Created new file: " .. filepath)
    else
        -- Open the existing file
        vim.cmd("edit " .. filepath)
    end
end, { desc = "Open or create file under cursor with missing directories" })
```

---

### **Line-by-Line Explanation:**

#### Line 1:

```lua
vim.keymap.set("n", "gf", function()
```

- **`vim.keymap.set`**:
  - Maps a key (`gf`) in Neovim.
  - Takes three arguments:
    1. Mode (`"n"` for normal mode).
    2. Key (`"gf"`).
    3. Callback function to execute when the key is pressed.
- **Purpose**: Customizes the behavior of `gf` in normal mode to handle file creation.

---

#### Line 2:

```lua
local filepath = vim.fn.expand("<cfile>")
```

- **`local`**: Declares a local variable, `filepath`.
- **`vim.fn.expand("<cfile>")`**:
  - **`vim.fn`**: Accesses Neovim’s Vimscript functions in Lua.
  - **`expand("<cfile>")`**:
    - Finds the file name under the cursor.
    - `<cfile>` represents the "current file" or text under the cursor that resembles a file path.
- **Purpose**: Extracts the file name or path under the cursor and stores it in `filepath`.

---

#### Line 3:

```lua
if vim.fn.filereadable(filepath) == 0 then
```

- **`if`**: A conditional statement.
- **`vim.fn.filereadable(filepath)`**:
  - Checks if the file exists and is readable.
  - Returns:
    - `1` if the file exists and is readable.
    - `0` otherwise.
- **`== 0`**: Tests if the file is not readable (i.e., it doesn’t exist).
- **Purpose**: Determines if the file needs to be created.

---

#### Line 4:

```lua
vim.fn.mkdir(vim.fn.fnamemodify(filepath, ":h"), "p")
```

- **`vim.fn.mkdir`**:
  - Creates a directory.
  - Takes two arguments:
    1. Path to the directory.
    2. Options (e.g., `"p"` to create parent directories recursively).
- **`vim.fn.fnamemodify(filepath, ":h")`**:
  - **`fnamemodify`**:
    - Modifies or extracts parts of a file path.
    - **`:h`**: Extracts the "head" (directory path) of the given file path. For example:
      - `subdir/example.txt` → `subdir`.
      - `/path/to/file.txt` → `/path/to`.
  - **Purpose**: Extracts the directory part of the file path.
- **Purpose of the Line**:
  - Ensures all parent directories for the file are created, preventing errors when creating files in non-existent directories.

---

#### Line 5:

```lua
vim.cmd("edit " .. filepath)
```

- **`vim.cmd`**:
  - Executes a Vim command from Lua.
  - Here, `"edit <filepath>"`:
    - Opens the specified file.
    - If the file doesn’t exist, it creates a new, empty file.
- **Purpose**: Opens the file for editing, creating it if it doesn’t exist.

---

#### Line 6:

```lua
print("Created new file: " .. filepath)
```

- **`print`**:
  - Outputs a message in Neovim's command area.
- **`"Created new file: " .. filepath`**:
  - Concatenates the string `"Created new file: "` with the `filepath` value.
- **Purpose**: Provides feedback to the user that a new file has been created.

---

#### Line 7:

```lua
else
```

- **`else`**: Specifies an alternative block of code to execute if the `if` condition evaluates to `false`.
- **Purpose**: Handles the case where the file already exists.

---

#### Line 8:

```lua
vim.cmd("edit " .. filepath)
```

- **Purpose**: Opens the existing file specified by `filepath`.

---

#### Line 9:

```lua
end
```

- **Purpose**: Ends the `if`-`else` block.

---

#### Line 10:

```lua
end, { desc = "Open or create file under cursor with missing directories" })
```

- **`end`**: Closes the function definition.
- **`{ desc = "..." }`**:
  - Provides a description for the key mapping.
  - Helps when listing key mappings with commands like `:map`.

---

### **Summary of Built-in Functions:**

1. **`vim.fn.expand("<cfile>")`**:

   - Extracts the file name or path under the cursor.

2. **`vim.fn.filereadable(filepath)`**:

   - Checks if the file exists and is readable.

3. **`vim.fn.mkdir(path, "p")`**:

   - Creates a directory and any missing parent directories if `"p"` is specified.

4. **`vim.fn.fnamemodify(filepath, ":h")`**:

   - Extracts the directory (head) portion of a file path.

5. **`vim.cmd("edit <filepath>")`**:

   - Opens the specified file, creating it if necessary.

6. **`print(message)`**:
   - Outputs a message to the Neovim command line.

---

Let me know if you need further clarification!
