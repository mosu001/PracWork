#!/usr/bin/env python
# coding: utf-8

# In[1]:



import openai


# In[20]:


from langchain.document_loaders import PyPDFDirectoryLoader

#loader = PyPDFDirectoryLoader(".", glob="**/practical-work-*-ocr.pdf")
loader = PyPDFDirectoryLoader(".", glob="**/practical-work-biomedical-exemplar-ocr.pdf")
docs = loader.load()
#print(docs)


# In[21]:


from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma

embeddings = OpenAIEmbeddings()
docsearch = Chroma.from_documents(docs, embeddings, persist_directory=".")
docsearch.persist()


# In[22]:


from langchain.chains import ConversationalRetrievalChain
from langchain.memory import ConversationBufferMemory
from langchain.llms import OpenAI

memory = ConversationBufferMemory(memory_key="chat_history", return_messages=True)
pdf_qa = ConversationalRetrievalChain.from_llm(OpenAI(temperature=0.8) , docsearch.as_retriever(), memory=memory)


# In[24]:


memory


# In[25]:


query = "What roles are described?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[26]:


query = "what was the job title??"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[27]:


query = "What was the ranking score for structure of the report?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[28]:


query = "What was the ranking score for presentation of the report?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[29]:


query = "What was the ranking score for scope of report?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[17]:


query = "What was the ranking score for scope of report?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[32]:


query = "How many hours of work were completed between July 1st, 2015 and December 7th, 2016? "
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[17]:


query = "What was the total value of marks?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[33]:


query = "What was the overall grade for this report?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[19]:


query = "Who did students work for in the docs?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[21]:


query = "What is the full company name that student worked for it?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]

### The Answer is wrong since in the document it is mentioned that the company name is University of Auckland


# In[22]:


query = "What was the nature of work for this document?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[24]:


query = "What are the number of hours worked by students in each classification?"
result = pdf_qa({"question": query})
print("Answer:")
result["answer"]


# In[ ]:





# In[ ]:




