function 35 --wraps scte35-go -d "Decode SCTE-35 binary data"
  if test (count $argv) -eq 1
    scte35-go decode $argv --out=xml
  else
    scte35-go $argv
  end
end
