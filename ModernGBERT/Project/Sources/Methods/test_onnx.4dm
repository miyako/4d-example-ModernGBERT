//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8081/v1"  // onnx-genai

$inputs:=[\
"Ich verstehe nur Bahnhof."; \
"Das ist mir völlig unklar und verwirrend."\
]

$batch:=$AIClient.embeddings.create($inputs)

$de1:=$batch.embeddings[0].embedding
$de2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$de1.cosineSimilarity($de2)