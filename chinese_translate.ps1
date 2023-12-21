$gbkEncoding = [System.Text.Encoding]::GetEncoding(936)
$big5Encoding = [System.Text.Encoding]::GetEncoding(950)

# search the current folder and translate its contain's name
Get-ChildItem | ForEach-Object {
    $fileName = $_.Name
    $gbkBytes = $big5Encoding.GetBytes($fileName)
    $hexgbkBytes = $gbkBytes | ForEach-Object { $_.ToString("X2") }
    $gbkFileName = $gbkEncoding.GetString($gbkBytes)

    # translate file name from gbk to big5
    # because my computer is encode with big5 and the file is encode with gbk, I need to decode with big5 to got the currect gbk code.
    $big5Bytes = [System.Text.Encoding]::Convert($gbkEncoding, $big5Encoding, $gbkBytes)
    $big5Bytes = $big5Encoding.GetBytes($gbkFileName)
    $hexbig5Bytes = $big5Bytes | ForEach-Object { $_.ToString("X2") }
    $big5FileName = $big5Encoding.GetString($big5Bytes)

    # Output to see the result.
    write-output "gbkBytes= $gbkBytes"
    write-output "hexgbkBytes= $hexgbkBytes"
    write-output "gbkFileName= $gbkFileName"
    write-output "big5Bytes= $big5Bytes"
    write-output "hexbig5Bytes= $hexbig5Bytes"
    write-output "big5FileName= $big5FileName"
}