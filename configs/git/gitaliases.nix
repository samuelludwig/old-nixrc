{ config, pkgs, libs, ... }:
{
  files = "!git diff --name-only $(git merge-base HEAD \"$REVIEW_BASE\")";
  stat = "!git diff --stat $(git merge-base HEAD \"$REVIEW_BASE\")";
  review = "!nvim -p $(git files) +\"tabdo Gdiff $REVIEW_BASE\" + \"let g:gitgutter_diff_base = '$REVIEW_BASE'\"";
  reviewone = "!nvim -p +\"tabdo Gdiff $REVIEW_BASE\" +\"let g:gitgutter_diff_base = '$REVIEW_BASE'\"";
  upstream = "!git push -u origin HEAD";
  co = "checkout";
}
