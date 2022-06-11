import Router from "next/router";
import { useState } from "react";

const Form = () => {
  const [state, setState] = useState({ login: "", name: "" });

  const handleChange = (e) => {
    setState({ ...state, [e.target.id]: e.target.value });
  };

  const handleClick = async () => {
    await addAccounts();
  };

  const addAccounts = async (): Promise<void> => {
    await fetch(`${process.env.NEXT_PUBLIC_API}/accounts`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ ...state, id: +new Date() }),
    });

    Router.push("/");
  };

  return (
    <>
      <div className="mb-4">
        <label
          className="block text-gray-700 text-sm font-bold mb-2"
          htmlFor="login"
        >
          Login
        </label>
        <input
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          id="login"
          type="text"
          placeholder="Enter login"
          onChange={handleChange}
        />
      </div>
      <div className="mb-4">
        <label
          className="block text-gray-700 text-sm font-bold mb-2"
          htmlFor="name"
        >
          Name
        </label>
        <input
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          id="name"
          type="text"
          placeholder="Enter name"
          onChange={handleChange}
        />
      </div>
      <div className="flex items-center space-between">
        <button
          className="bg-blue-500 hover:bg-blue-700 disabled:opacity-50 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="button"
          onClick={handleClick}
          disabled={!state.name.length || !state.login.length}
        >
          Add
        </button>{" "}
        <button
          className="bg-white text-blue-500 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="button"
          onClick={() => Router.push("/")}
        >
          Back
        </button>
      </div>
    </>
  );
};

export default Form;
