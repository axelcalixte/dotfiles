return {
   { "echasnovski/mini.surround", version = "*", opts = {} },
   { "echasnovski/mini.trailspace", version = "*", opts = {
      even_while_inserting = true,
      only_in_normal_buffers = true,
   } },
   { "numToStr/Comment.nvim", opts = {}, event = "InsertEnter" },
}
