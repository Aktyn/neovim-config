-- Automatically close unused buffers
return {
  "chrisgrieser/nvim-early-retirement",
  event = "VeryLazy",
  -- config = true,
  opts = {
    retirementAgeMins = 30,
    minimumBufferNum = 4,
  },
}
