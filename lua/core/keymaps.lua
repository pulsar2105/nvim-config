-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- on utilise ;; pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

----------------------------- Déplacement du texte ----------------------------

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-i>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap("x", "<S-i>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap("x", "<S-k>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

-------------------------- Déplacement entre fenêtre --------------------------

-- Changement de fenêtre avec Ctrl + déplacement uniquement au lieu de Ctrl-w + déplacement
keymap("n", "<C-h>", "<C-w>h", { desc = "Déplace le curseur dans la fenêtre de gauche" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Déplace le curseur dans la fenêtre du bas" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Déplace le curseur dans la fenêtre du haut" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Déplace le curseur dans la fenêtre droite" })

-- Déplacment entre buffers
-- Navigation entre les buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Aller au buffer suivant" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Aller au buffer précédent" })

---------------------------------- Sauvegarde ---------------------------------
keymap("n", "<C-s>", ":w<CR>", { desc = "Sauvegarder le fichier" })
-- enregistrer sous un nouveau nom
keymap("n", "<C-S-s>", ":saveas ", { desc = "Enregistrer le fichier sous un nouveau nom" })

------------------------------- Session Manager -------------------------------
----- load the session for the current directory
keymap("n", "<leader>ls", function() require("persistence").load() end,
    { desc = "Charger la session pour le répertoire actuel" })

-- select a session to load
keymap("n", "<leader>lS", function() require("persistence").select() end, { desc = "Sélectionner une session à charger" })

-- load the last session
keymap("n", "<leader>ll", function() require("persistence").load({ last = true }) end,
    { desc = "Charger la dernière session" })

-- stop Persistence => session won't be saved on exit
keymap("n", "<leader>ld", function() require("persistence").stop() end,
    { desc = "Arrêter Persistence => la session ne sera pas sauvegardée à la fermeture" })
