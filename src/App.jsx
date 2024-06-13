import { useState } from 'react'
import './App.css'
import axios from "axios";

function App() {
  const [Question, setquestion] = useState("");
  const [Answer, setAnswer] = useState("");

  async function generateAnswer() {
    setAnswer("Loading");
    const response = await axios({
      url: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyDxN6nbUdLn5_1nXaZa2d5LZG03L_r3PGI",
      method: "post",
      data: {"contents":[{"parts":[{"text":Question}]}]}
    });
    setAnswer(response['data']['candidates'][0]['content']['parts'][0]['text']);
  }

  return (
    <>
      <h1>Chat Bot</h1>
      <textarea value={Question} onChange={(e) => setquestion(e.target.value)}></textarea>
      <button onClick={generateAnswer}>Answer</button>
      <pre>{Answer}</pre>
    </>
  )
}

export default App;

