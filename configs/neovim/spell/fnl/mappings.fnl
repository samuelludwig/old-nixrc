(module dotfiles.mapping
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util
             core aniseed.core}})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

(defn- nnoremap [from to]
  "Sets a mapping for NORMAL mode."
  (noremap :n from to))

(defn- inoremap [from to]
  "Sets a mapping for INSERT mode."
  (noremap :i from to))

(defn- vnoremap [from to]
  "Sets a mapping for VISUAL mode."
  (noremap :v from to))

(defn- toggle-background []
  "Toggles the `background` variable between light and dark"
  (let [current-background (nvim.nvim_get_var "background")]
  (if (= current-background "dark")
    (set nvim.g.background "light")
    (set nvim.g.background "dark"))))

;; Generic mapping configuration.
(nnoremap :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Make omnifunc useable
(inoremap :<C-C> :<C-X><C-O>)

;; Toggle background between "light" and "dark"
(nnoremap :<Leader>b (toggle-background))

;; Telescope binds
(defn- telescope-cmd [command]
  (core.concat ["<cmd>Telescope " command "<cr>"]))

(nnoremap :<Leader>ff (telescope-cmd "find_files"))
(nnoremap :<Leader>fg (telescope-cmd "live_grep"))
(nnoremap :<Leader>fb (telescope-cmd "buffers"))
(nnoremap :<Leader>fh (telescope-cmd "help_tags"))

;; Set current buffer to maxsize, minimzing all others
(nnoremap :<Leader>rs :resize<cr>)

;; Ranger style marks command
(defn- get-char-from-user []
  (nvim.command "getchar()"))

(defn- number-to-char [n]
  (nvim.command
    (core.concat ["nr2char(" n ")"])))

(defn- get-symbol-from-user []
  (-> (get-char-from-user)
      (number-to-char)))

(defn- run-commands [...]
  (let [cmd-list (ipairs ...)]
    (run! nvim.command cmd-list)))

(defn- show-marks []
  (run-commands "marks" "echo('Mark: ')")
  (let [mark (get-symbol-from-user)
        go-to-mark (core.concat ["execute \"normal! '\"" mark])]
    (run-commands "redraw" (go-to-mark))))

(nnoremap "'" show-marks)

(nnoremap :<Leader>fc (a.println "we're real pog"))
