FROM langchain/langgraphjs-api:20
RUN npm install tsx hono
ADD . /deps/test_langgraph_js
ENV LANGGRAPH_HTTP='{"app": "/deps/test_langgraph_js/src/agent/app.ts:app"}'

ENV LANGSERVE_GRAPHS='{"agent":"/deps/test_langgraph_js/src/agent/graph.ts:graph"}'

WORKDIR /deps/test_langgraph_js
RUN npm ci
RUN (test ! -f /api/langgraph_api/js/build.mts && echo "Prebuild script not found, skipping") || tsx /api/langgraph_api/js/build.mts