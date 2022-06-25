import Head from "next/head";
import Router from "next/router";
import { useEffect, useState } from "react";
import Header from "../components/header/header";
import Table from "../components/table/table";

export default function Home() {
  const [accounts, setAccounts] = useState<any[]>([]);

  const fetchAccounts = async (): Promise<void> => {
    await fetch(`${process.env.NEXT_PUBLIC_API}/accounts`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => setAccounts(data));
  };

  useEffect(() => {
    fetchAccounts();
  }, []);

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
            <div className="columns-2">
              <h1 className="text-3xl font-bold text-gray-900">Accounts</h1>
              <div className="text-right">
                <button
                  className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline place-self-end"
                  type="button"
                  onClick={() => Router.push("/add")}
                >
                  Add
                </button>
              </div>
            </div>
          </div>
        </header>
        <main>
          {accounts.length > 0 && (
            <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
              <Table values={accounts} />
            </div>
          )}
        </main>
      </main>
    </div>
  );
}
