import os;
import from byllm.llm { Model }

// Global LLM used to estimate vehicle prices. Make sure GOOGLE_API_KEY is set in env.
glob llm = Model(
    model_name = 'gemini-2.5-flash',
    provider = 'google',
    verbose=false,
    temperature=0.0,
    google_api_key = os.environ.get("GOOGLE_API_KEY"),
);

"""
Estimate the approximate retail cost in Kenya (KES) for the given vehicle model.

Instructions to the model: return a short, concise estimate in Kenyan Shillings (KES).
If a range is more appropriate, return a short range. Include the currency (KES).
Keep the answer one or two sentences.
"""
def estimate_cost_in_kenya(vehicle: str, question: str) -> str by llm;

with entry:__main__ {
    
    def get_input() -> any {
        user_input: str = input("Enter vehicle model (e.g., Toyota Corolla) to get The Estimated Cost in Kenya: ");
        return user_input;
    }

    def get_output() -> any {
        user_input = get_input().strip();

        if user_input == "" {
            print("No vehicle model provided. Please enter a valid vehicle model.");
            return get_output();
        } 
        else if user_input == "exit" or user_input == "quit" {
            print("Goodbye! and have a nice day.");
            return;
        } 
        else {
            question: str = "What is the cost of a " + user_input + " in Kenya?";
            print(estimate_cost_in_kenya(user_input, question));
            return get_output();
        }
    }

    get_output();
}
