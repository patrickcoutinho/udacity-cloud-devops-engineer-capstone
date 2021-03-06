const Table = ({ values }) => {
  return (
    <table className="border-collapse table-fixed w-full text-sm bg-slate-800">
      <thead>
        <tr>
          <th className="border-b w-40 dark:border-slate-600 font-medium p-4 pt-3 pb-3 text-slate-200 text-left">
            ID
          </th>
          <th className="border-b dark:border-slate-600 font-medium p-4 pt-3 pb-3 text-slate-200 text-left">
            Login
          </th>
          <th className="border-b dark:border-slate-600 font-medium p-4 pt-3 pb-3 text-slate-200 text-left">
            Name
          </th>
        </tr>
      </thead>
      <tbody className="bg-slate-800">
        {values.length &&
          values.map((item, key) => (
            <tr key={key}>
              <td className="border-b border-slate-100 dark:border-slate-700 p-4 text-slate-400">
                {item.id}
              </td>
              <td className="border-b border-slate-100 dark:border-slate-700 p-4 text-slate-400">
                {item.login}
              </td>
              <td className="border-b border-slate-100 dark:border-slate-700 p-4 text-slate-400">
                {item.name}
              </td>
            </tr>
          ))}
      </tbody>
    </table>
  );
};

export default Table;
