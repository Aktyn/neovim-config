-- Automatically close unused buffers
return {
  "chrisgrieser/nvim-early-retirement",
  event = "VeryLazy",
  -- config = true,
  opts = {
    retirementAgeMins = 60,
    minimumBufferNum = 6,
  },
}
