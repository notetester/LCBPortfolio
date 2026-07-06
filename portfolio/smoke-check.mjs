import { readFileSync } from "node:fs";

const files = {
  app: "portfolio/app.js",
  css: "portfolio/app.css",
  home: "index.html",
  demo: "demo/index.html",
  domain: "docs/domain.html",
  architecture: "docs/architecture.html",
  quality: "docs/quality.html",
  readme: "README.md"
};

const read = (path) => readFileSync(path, "utf8");
const text = Object.entries(files).map(([name, path]) => `\n--- ${name} ---\n${read(path)}`).join("\n");

const required = [
  "좌석 선점",
  "결제 승인",
  "취소/환불",
  "운영 콘솔",
  "같이 보기",
  "Domain Model",
  "Guided Demo",
  "smoke-check"
];

const forbidden = [
  "원본 팀",
  "커밋 히스토리",
  "복구본",
  "Recovery",
  "Static Demo"
];

const missing = required.filter((term) => !text.includes(term));
const leaked = forbidden.filter((term) => text.includes(term));

if (missing.length) {
  throw new Error(`Missing portfolio markers: ${missing.join(", ")}`);
}

if (leaked.length) {
  throw new Error(`Forbidden portfolio wording remains: ${leaked.join(", ")}`);
}

console.log(`LCB portfolio smoke check passed (${required.length} markers, ${Object.keys(files).length} files).`);
