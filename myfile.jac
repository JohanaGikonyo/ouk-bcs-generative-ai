import os;
import from byllm { Model }

# Load environment variable

glob llm = Model(
    model_name = 'gemini-2.5-flash',
    provider = 'google',
    verbose=False,
    temperature=0.5,
    google_api_key = os.environ.get("GOOGLE_API_KEY"), 
);



enum Tell {
    Yes = 'I am gemini, a large language model developed by Google.',
    No = 'I dont know.',
}
enum Personality{
    Introvert='Introvert' ,
    Extrovert='Extrovert',
    Ambivert='Ambivert'
}

"""Yes/No Answering bot"""
def yes_or_no(question: str) -> Tell by llm;

"""Explainable answering: return a short answer and an explanation (free text).
    This uses the same model but returns a string explanation. You can prompt the
    model to return JSON or a specific format if you want to parse programmatically.
"""
def explain(question: str) -> str by llm;
def give_answer(question:str)->str by llm;
def translate(text:str, target_language:str)->str by llm;
def get_personality(name: str) ->Personality by llm;


with entry {
    # question: str = "What is Log 1000?";

    # # Short yes/no style using the enum
    # answer: Tell = yes_or_no(question);

    # # Free-text explanation from the model
    # explanation: str = explain(question);

    # answer2: str = give_answer(question);

    # print(f'Question: {question}');
    # # print(f'Yes/No Answer: {answer.value}');
    # print(f'Explanation: {explanation}');
    # print(f'Answer: {answer2}');
    # question: str = "Translate 'What is Log 1000?' to Kiswahili";
    # print(f'Question: {question} : {translate(question, "Kiswahili")}');
    name: str = "Albert Einstein";
    results = get_personality(name);
    print(f'Name: {name} Personality: {results.value} ');
}
