return {
  buffers = {
    window = {
      position = "float",
    },
  },
  window = {
    mappings = {
      ["x"] = "close_node",
      ["X"] = "close_all_nodes",
      ["O"] = "expand_all_nodes",
      ["D"] = "delete",
      ["d"] = "cut_to_clipboard",
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"] = "git_add_all",
        ["u"] = "git_unstage_file",
        ["a"] = "git_add_file",
        ["r"] = "git_revert_file",
        ["c"] = "git_commit",
        ["p"] = "git_push",
        ["g"] = "git_commit_and_push",
      },
    },
  },
}
