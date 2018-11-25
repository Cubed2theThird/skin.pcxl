$n = (Get-content .\Colors.txt | Measure-Object).count
$c = 0

Remove-Item -Path .\colors -Force -Recurse
Copy-Item .\Colors.txt .\Colorscodes.txt
Remove-Item -Path .\Include_Colors.xml
New-Item -Path .\ -Name "colors" -ItemType "directory" -Force

"Downloading Colors"
do {
cls
"Downloading $c of $n"
$text = Get-Content .\Colors.txt -First 1

$storageDir = $pwd
$webclient = New-Object System.Net.WebClient
$url = "https://dummyimage.com/100x100/$text/$text.png"
$file = "$storageDir\Colors\$text.jpg"
$webclient.DownloadFile($url,$file)

Get-Content $storageDir\Colors.txt | Select-Object -Skip 1 | Out-File $storageDir\Colors2.txt
Remove-Item -Path $storageDir\Colors.txt
Rename-Item -Path $storageDir\Colors2.txt $storageDir\Colors.txt -Force
$c++
}
until ($c -eq $n)

$n = (Get-content .\Colorscodes.txt | Measure-Object).count
$c = 0

"<includes>" | Out-File $storageDir\Include_Colors.xml
"<include name=" + '"' + "Colors" + '"' + ">"  | Out-File $storageDir\Include_Colors.xml -Append
"<param name=" + '"' + "type" + '"' + "/>" | Out-File $storageDir\Include_Colors.xml -Append
"<definition>" | Out-File $storageDir\Include_Colors.xml -Append

"Coverting To Code"
do {
cls
"Coverting $c of $n"
$color = Get-Content .\Colorscodes.txt -First 1
$storageDir = $pwd


"<item>" | Out-File $storageDir\Include_Colors.xml -Append
"<label>" + '$NUMBER[' + $color + "]</label>" | Out-File $storageDir\Include_Colors.xml -Append
"<onclick>Skin.Setstring(" + '$PARAM[type]' + ",$color)</onclick>" | Out-File $storageDir\Include_Colors.xml -Append
"<icon>colors\$color.jpg</icon>" | Out-File $storageDir\Include_Colors.xml -Append 
"</item>" | Out-File $storageDir\Include_Colors.xml -Append

Get-Content $storageDir\Colorscodes.txt | Select-Object -Skip 1 | Out-File $storageDir\Colorscodes2.txt
Remove-Item -Path $storageDir\Colorscodes.txt
Rename-Item -Path $storageDir\Colorscodes2.txt $storageDir\Colorscodes.txt -Force
$c++
}
until ($c -eq $n)

"</definition>"  | Out-File $storageDir\Include_Colors.xml -Append
"</include>" | Out-File $storageDir\Include_Colors.xml -Append
"</includes>" | Out-File $storageDir\Include_Colors.xml -Append
Get-Content $storageDir\Include_Colors.xml | Out-File -Encoding UTF8 -FilePath $storageDir\Include_Colors2.xml
Remove-Item -Path $storageDir\Include_Colors.xml
Rename-Item -Path $storageDir\Include_Colors2.xml $storageDir\Include_Colors.xml -Force
"Done"
