import { useState } from 'react';
import axios from "axios";

function App() {
  const [Question, setQuestion] = useState("");
  const [Answer, setAnswer] = useState("");
  const [isLoading, setIsLoading] = useState(false); // Track loading state

  async function generateAnswer() {
    setAnswer("Loading...");
    setIsLoading(true);

    try {
      const response = await axios({
        url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${import.meta.env.VITE_GEMINI_API_KEY}`,
        method: "post",
        data: { "contents": [{ "parts": [{ "text": Question }] }] }
      });
      console.log("Response data:", response.data);
      setAnswer(response.data.candidates[0].content.parts[0].text);
    } catch (error) {
      console.error("Error fetching the answer:", error);
      setAnswer("Error fetching the answer");
    } finally {
      setIsLoading(false);
    }
  }

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-3xl font-bold mb-4">Chat Bot</h1>
      <textarea
        className="border border-gray-300 rounded-lg p-2 w-full mb-4"
        value={Question}
        onChange={(e) => setQuestion(e.target.value)}
        placeholder="Enter your question..."
      ></textarea>
      <button
        className={`bg-blue-500 text-white px-4 py-2 rounded-lg ${isLoading ? 'opacity-50 cursor-not-allowed' : ''}`}
        onClick={generateAnswer}
        disabled={isLoading}
      >
        {isLoading ? 'Loading...' : 'Answer'}
      </button>
      {Answer && (
        <div className="mt-4">
          <strong>Response:</strong>
          <pre className="border border-gray-300 rounded-lg p-2 mt-2">{Answer}</pre>
        </div>
      )}
    </div>
  );
}

export default App;
