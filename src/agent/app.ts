import { Hono } from "hono";
import { graph } from "./graph.js";

export const app = new Hono();

app.get("/hello", (c) => c.json({ hello: "world" }));
app.get("/run-graph", async (c) => {
  const state = { messages: [] };
  const result = await graph.invoke(state);
  return c.json(result);
});


// serve({
//   fetch: app.fetch,
//   port: 3000,
// })

// console.log('✅ Server running on http://localhost:3000')



// export { app };

