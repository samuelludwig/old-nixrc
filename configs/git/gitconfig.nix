{
  github.user = "samuelludwig";
  pull.rebase = false;
  core.pager = "delta --theme='TwoDark'";
  interactive.diffFilter = "delta --color-only";

  "filter \"lfs\"" = {
      clean = "git-lfs clean -- %f";
      smudge = "git-lfs smudge -- %f";
      process = "git-lfs filter-process";
      required = true;
  };

  http.postBuffer = 524288000;
  credential.helper = "store";
  init.defaultBranch = "master";
}
