import Head from "next/head";
import Form from "../components/form/form";
import Header from "../components/header/header";

export default function Add() {
  return (
    <div>
      <Head>
        <title>Frontend</title>
        <meta
          name="description"
          content="Frontend | Udacity Cloud DevOps Engineer Capstone"
        />
      </Head>
      <header>
        <Header />
      </header>

      <main>
        <header className="bg-white shadow">
          <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
            <h1 className="text-3xl font-bold text-gray-900">Add Account</h1>
          </div>
        </header>
        <main>
          <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <Form />
          </div>
        </main>
      </main>
    </div>
  );
}
