# 에이전틱 기업 운영: HR 및 비기술직군을 위한 Claude Code 마스터 가이드

본 문서는 AI를 단순한 채팅 도구가 아닌, 내 컴퓨터의 파일을 직접 다루고 외부 시스템과 협업하는 '업무 실행자(Agent)'로 활용하기 위한 통합 가이드입니다. VS Code 환경과 마크다운(Markdown)을 도구 삼아 AI 에이전트 팀을 지휘하는 법을 배웁니다.[^1]

---

## 1. CLAUDE.md

CLAUDE.md는 Claude Code가 작업을 시작할 때 가장 먼저 읽는 '운영 지침서'입니다. AI에게 매번 같은 지시를 반복할 필요 없이, 이 파일에 한 번 적어두면 AI가 프로젝트 내내 그 규칙을 준수합니다.[^3]

### 무엇이고 어떻게 작동하나요?

- **개념:** AI가 매 세션 시작 시 자동으로 로드하는 마크다운 파일입니다.[^3]
- **저장 위치:**
  - 사용자용: `~/.claude/CLAUDE.md` (내 컴퓨터의 모든 프로젝트에 공통 적용)[^3]
  - 프로젝트용: `./CLAUDE.md` (특정 폴더에 위치하며 팀원과 Git으로 공유 가능)[^3]
- **구조:** 마크다운 헤더(`#`)와 목록(`-`)을 사용하여 AI의 페르소나, 어조, 핵심 규칙을 정의합니다.[^4]
- 200행 이내로 작성 권장

저는 제 코딩 철학과, 환경 설정에 대한 내용이 작성되어 있습니다.

### 실습

- **회사 문서 서식 적용:** Google Docs 서식은 다음과 같이 정리해줘. 기본 글꼴은 Arial로 하고, `#` (제목 1)은 20pt 굵게, `##` (제목 2)는 16pt 굵게, `###` (제목 3)는 12pt 굵게, 일반 텍스트는 11pt로 설정해.
- **보안 규칙 적용:** "개인정보(이름, 전화번호)가 포함된 문장은 절대로 외부로 출력하지 말고 해당 정보를 `*`로 마스킹 처리해"라는 규칙을 적고 제대로 작동하는지 확인합니다.[^5]
- **직무 특성 적용:** "채용 보고서 작성 시 성별이나 연령에 대한 편향된 표현을 금지할 것"

---

## 2. 서브에이전트 (Subagents)

복잡한 프로젝트는 한 명의 AI가 아닌, 역할이 분담된 여러 에이전트가 동시에 처리하는 것이 훨씬 빠르고 정확합니다.[^3]

### 무엇이고 어떻게 작동하나요?

- **개념:** 메인 에이전트가 특정 업무를 수행하기 위해 소환하는 '하위 AI 작업자'입니다.
- **작동 방식:** 복잡한 일을 시키면 메인 AI가 '계획 수립 에이전트', '파일 수정 에이전트' 등을 생성하여 일을 나눕니다.

#### 언제/왜 쓰나요?

> **Best use case**
>
> Use a subagent for high-volume exploration: finding where logic lives, tracing a feature across files, summarizing a module, or reviewing code after a change. Claude's docs specifically say subagents are useful when a side task would flood the main conversation with file contents, logs, or search results, and the built-in Explore agent is designed for code search and codebase understanding with read-only tools.

- **맥락 격리(Context Isolation):** 서브에이전트는 독립된 대화창(Context Window)에서 실행되므로, 방대한 데이터 분석 과정의 불필요한 내용이 메인 대화창을 어지럽히지 않습니다.
- **독립 워크트리:** 각 에이전트는 `.claude/worktrees/`라는 독립된 임시 폴더에서 작업하므로, 서로 다른 에이전트가 같은 파일을 동시에 수정하여 충돌을 일으키는 문제를 방지합니다.
- **빌트인 에이전트:** Explore(Haiku 모델 기반의 고속 읽기 전용), Plan(실행 전 리서치 담당) 등이 자동으로 소환되어 비용과 속도를 최적화합니다.

### 활용 사례

- **일상 업무:** 수백 개의 이메일을 분류하는 에이전트와 답장 초안을 쓰는 에이전트를 동시에 운영.[^7]
- **리서치:** 에이전트 A는 경쟁사 웹사이트를 조사하고, 에이전트 B는 그 결과를 사내 보고서 양식에 맞게 다듬기.[^2]
- **Fun:** "낙관론자 에이전트"와 "비관론자 에이전트"를 각각 만들어 내 사업 계획의 장단점을 토론시키기.[^3]

### 실습 과제

- **일기 에이전트** → `/agents` → 내가 오늘 있었던 일을 간략하게 작성하면 `날짜_diary.md` 파일을 날짜/제목/본문으로 작성해서 기록해줘
- **명함 만들기 에이전트** → 원하는 스타일로 만들고 → 그걸 프로젝트 에이전트로 만들어달라고 요청
- 조사/초안/검수 서브 에이전트
- 내가 주는 agent 실행 → 와이어프레임 에이전트

---

## 3. 스킬 (Skills)

스킬은 자주 반복되는 업무 프로세스를 `/summary`와 같은 짧은 명령어로 만들어 팀 전체가 공유하는 기능입니다.[^3]

### 무엇이고 어떻게 작동하나요?

- **개념:** 특정 폴더 구조 내에 작성된 `SKILL.md` 파일로 정의된 패키지 지식입니다.[^3]
- **구조:**
  - YAML 영역: 스킬 이름, 설명, 허용된 도구 설정.[^3]
  - Markdown 영역: AI가 수행해야 할 구체적인 업무 매뉴얼(SOP).[^3]
- **저장:** 개인용은 `~/.claude/skills/`, 프로젝트 공유용은 `.claude/skills/`에 저장합니다.[^3]

### 실습 과제

- **요약 스킬 만들기:** `~/.claude/skills/brief/SKILL.md`를 만들고 "3줄 요약과 1개의 행동 지침으로 정리해"라는 내용을 적으세요. 이후 터미널에서 `/brief [파일명]`을 입력해 보세요.[^8]
- **인자 활용:** 이름과 직무를 입력받아 면접 제안 메일을 작성하는 스킬을 만들고 `/draft-email 김철수 보안관제`와 같이 실행해 보세요.[^3]
- Slide maker
- 영수증 처리
- 사이트 만든 후 frontend-design
- **document-skills (공식 Big Four):** Docx/Xlsx/PDF 등 문서 처리. 보고서 자동화. Md → Word. "DOCX skill을 써서 md 파일을 docx로 전환해줘"

---

## 4. MCP (Model Context Protocol)

MCP는 Claude가 내 컴퓨터 밖의 세상(Notion, Google Sheets, 웹 검색 등)과 직접 소통하게 해주는 '보편적인 연결 포트'입니다.

### 무엇이고 어떻게 작동하나요?

- **개념:** AI가 외부 데이터에 접근할 수 있게 해주는 개방형 표준 규격입니다.
- **작동 방식:**
  - Host: Claude Code 앱
  - Server: 노션이나 구글 시트와 연결된 통로[^10]
- **특징:** 민감한 데이터가 AI 서버로 통째로 넘어가지 않고, 내 컴퓨터 내에서 필요한 정보만 처리한 후 그 '내용'만 AI가 읽습니다.

### 활용 사례

- **일상 업무 (Notion):** "노션의 정책 위키에서 '재택근무 규정'을 찾아 현재 폴더에 마크다운 파일로 요약해줘."
- **데이터 관리 (Sheets):** "구글 시트의 15행에 있는 지원자의 면접 상태를 '합격'으로 실시간 변경해줘."[^11]
- **Fun:** Playwright MCP를 연결하여 "지금 내 주변의 맛집 5곳을 찾아 구글 맵 링크와 대표 메뉴를 표로 정리해줘."

### 전문가용 심화 가이드: 아키텍처 및 전송 규격

- **Transport Layer:** 데이터는 JSON-RPC 2.0 규격으로 통신합니다. 로컬 시스템 리소스는 속도가 빠른 `stdio` 방식을, 원격 리소스는 실시간 스트리밍이 가능한 `SSE` 방식을 주로 사용합니다.
- **할루시네이션(환각) 방지:** AI가 과거 지식에 의존하는 대신 실시간 데이터베이스를 조회하므로 "아마도 이럴 것"이라는 추측성 답변이 획기적으로 줄어듭니다.[^10]

### 실습 과제

- **파일 탐색:** Filesystem MCP를 사용하여 "내 문서 폴더에서 '계약서'라는 단어가 들어간 파일을 모두 찾아서 목록을 만들어줘"라고 지시해 보세요.
- **웹 정보 연합:** 웹 검색 MCP를 사용하여 "오늘 발생한 최신 보안 취약점(CVE) 뉴스를 찾아 우리 프로젝트 파일들과 관련이 있는지 분석해줘"라고 명령해 보세요.[^2]

---

## Works Cited

[^1]: Claude Code | Anthropic's agentic coding system, accessed May 14, 2026, https://www.anthropic.com/product/claude-code
[^2]: modelcontextprotocol/servers: Model Context Protocol Servers - GitHub, accessed May 14, 2026, https://github.com/modelcontextprotocol/servers
[^3]: Claude Code overview - Claude Code Docs, accessed May 14, 2026, https://code.claude.com/docs/en/overview
[^4]: 5 real-world Model Context Protocol integration examples - Merge.dev, accessed May 14, 2026, https://www.merge.dev/blog/mcp-integration-examples
[^5]: 생성형 AI 활용 보안 가이드 - 전남대학교 정보화본부, accessed May 14, 2026, https://ucc.jnu.ac.kr/ucc/22651/subview.do
[^6]: HR을 위한 인공 지능 - IBM, accessed May 14, 2026, https://www.ibm.com/kr-ko/think/topics/ai-in-hr
[^7]: Model Context Protocol - Wikipedia, accessed May 14, 2026, https://en.wikipedia.org/wiki/Model_Context_Protocol
[^8]: Extend Claude with skills - Claude Code Docs, accessed May 14, 2026, https://code.claude.com/docs/en/skills
[^9]: 회사 일이 '절반' 되는 AI 루틴, 회사에서 바로 적용되는 AI 자동화 시나리오 10가지 - 메일리, accessed May 14, 2026, https://maily.so/nogadahunter/posts/wjzdpkd0z3p
[^10]: What is Model Context Protocol (MCP)? A guide | Google Cloud, accessed May 14, 2026, https://cloud.google.com/discover/what-is-model-context-protocol
[^11]: Google Sheets - Awesome MCP Servers, accessed May 14, 2026, https://mcpservers.org/servers/jona-mhw/google-sheets-mcp
[^12]: Notion MCP - Notion Docs - the Notion API, accessed May 14, 2026, https://developers.notion.com/guides/mcp/overview
