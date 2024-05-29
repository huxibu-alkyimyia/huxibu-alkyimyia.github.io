from openai import OpenAI
import json

client = OpenAI(
    base_url="https://oneapi.xty.app/v1",
    api_key="sk-tNRyIhlJU8FHxJFl956561Ba5bD641589470C742A1E1F615"
)

completion = client.chat.completions.create(
  model="gpt-3.5-turbo",
  messages=[
    {"role": "system", "content": "You are a helpful AI assistant."},
    {"role": "user", "content": "请写一段关于寄存器原理的介绍，用于逻辑电路设计课程的实验指导书中。"}
  ]
)

print(completion.choices[0].message.content)
