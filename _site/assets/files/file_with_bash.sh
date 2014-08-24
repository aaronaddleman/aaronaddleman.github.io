function abc() {
  ls /path/to/file
  export set VAR="abc"
  if [[ -z VAR ]]; then
    echo "i exist"
  else
    echo "i need data!"
  fi
}
