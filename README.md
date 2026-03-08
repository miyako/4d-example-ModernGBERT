## [LSX-UniWue/ModernGBERT_134M](https://huggingface.co/LSX-UniWue/ModernGBERT_134M)

```4d
var $en; $fr : 4D.Vector
var $AIClient : cs.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8081/v1"  // onnx-genai

$inputs:=[\
"Ich verstehe nur Bahnhof."; \
"Das ist mir völlig unklar und verwirrend."\
]

$batch:=$AIClient.embeddings.create($inputs)

$de1:=$batch.embeddings[0].embedding
$de2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$de1.cosineSimilarity($de2)
```

##### Cosine similarity from example code above:

||llama.cpp `Q8_0`|ONNX Runtime `Int8`|
|-|:-|:-|
|🇩🇪|`0.8556957123575`|`0.8533958458509`|
