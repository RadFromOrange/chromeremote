from haystack.document_stores import InMemoryDocumentStore
from haystack.nodes import DensePassageRetriever, FARMReader
from haystack.pipelines import ExtractiveQAPipeline
from haystack.utils import convert_files_to_docs

# 1. Create an in-memory document store
document_store = InMemoryDocumentStore()

# 2. Load the document from a text file
def load_documents_from_file(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        content = file.read()
    return [{"content": content}]

documents = load_documents_from_file("Doc.txt")
document_store.write_documents(documents)

# 3. Initialize Retriever and Reader models
retriever = DensePassageRetriever(document_store=document_store)
reader = FARMReader(model_name_or_path="deepset/roberta-base-squad2")

# 4. Build a pipeline for question answering
pipeline = ExtractiveQAPipeline(reader, retriever)

# 5. Ask a question
query = "What is the document about?"
result = pipeline.run(query=query)

# 6. Print the result
print(result)
