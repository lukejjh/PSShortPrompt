function prompt {
  $ESC = [char]27

  $Location = (Get-Location).Path
  $MaxLength = 18
  
  $TrimAmount = [System.Math]::Min($Location.Length, $MaxLength)
  $PrefixString = $TrimAmount -lt $Location.Length | % { ("…", "")[!$_] }
  $TruncatedPath = ($Location.Substring($Location.Length - $TrimAmount, $TrimAmount)).Trim() -replace "^\\",""

  "PS $ESC[1m${PrefixString}${TruncatedPath}$ESC[0m> "
}