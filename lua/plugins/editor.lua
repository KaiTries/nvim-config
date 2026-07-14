return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buffer)
        local gs = require("gitsigns")
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
        map("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")
        map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk")
        map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>ghd", gs.diffthis, "Diff this")
      end,
    },
  },
  {
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },
}
