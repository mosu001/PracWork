from langchain.vectorstores import Chroma
from langchain.embeddings import OpenAIEmbeddings
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.llms import OpenAI
from langchain.chains import VectorDBQA
from langchain.document_loaders import PyPDFDirectoryLoader

loader = PyPDFDirectoryLoader(".", glob="**/practical-work-*-ocr.pdf")
documents = loader.load()

text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=0)
texts = text_splitter.split_documents(documents)
#print(texts[0:1])

# Embed and store the texts
# Supplying a persist_directory will store the embeddings on disk
persist_directory = '.'

import os
embedding = OpenAIEmbeddings(openai_api_key=os.environ["OPENAI_API_KEY"])
vectordb = Chroma.from_documents(documents=texts, embedding=embedding, persist_directory=persist_directory)
vectordb.persist()