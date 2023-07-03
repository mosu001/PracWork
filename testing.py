from langchain.agents import create_csv_agent

from langchain.llms import OpenAI

agent_new = create_csv_agent(OpenAI(temperature=0), 'pracwork_new.csv', verbose=True)
agent_old = create_csv_agent(OpenAI(temperature=0), 'pracwork_old.csv', verbose=True)

#agent.run("how many rows are there?")

#agent.run("how many projects have Specialty CIV or specialization Civil?")

#agent.run("how many unique companies are involved in projects with Specialty CIV or specialization Civil?")

#agent_new.run("Count number of projects by company and discipline and give me the top 10 with discipline = CSYS")
#agent_new.run("Count number of projects by company and discipline and give me the top 10 with company = University Of Auckland")
agent_new.run("Make University Of Auckland and The University Of Auckland the same company")
agent_new.run("Count number of projects by company give me the top 10")

#agent_old.run("Count number of projects by company and specialization and give me the top 10 for Civil specialization")
