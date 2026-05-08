# Week 1 Outline — 에이전트와 일하기 (deck.html 소스)

## 0. 도착 / 체크인
- QR 코드 (컨디션 체크 + AI-native 레벨 셀프 진단)

## 1. 오리엔테이션
- 강사 소개 (quietoperatorslab.com)
- 과정 소개 — 4주 흐름: W1 Foundation → W2 Tooling → W3 Orchestration → W4 Demo (quietoperatorslab.com)
- 운영 방식: 수업 + 과제 + AI-native transformation + 4주차 본인이 깎은 업무 자동화 발표
- 1:1 Office Hour (온라인) — 본인 업무 자동화를 직접 돕는 시간. 막힌 지점 / 지시서 다듬기 / agent·skill 설계 상담
- 오늘의 학습 목표 3가지
  1) Claude Code 주요 명령어와 agent / skill / CLAUDE.md를 다룰 수 있다
  2) AI-native — 문서 작업 없이 AI로만 문서 작성을 마무리한다
  3) GitHub에 올릴 수 있다
- 왜 배우는가? — AI agent 시대, agent를 돌리며 1인이 할 수 있는 역량이 크게 확장됨
- AI-native transition을 시작하면 찾아오는 변화 5가지
  1) 비동기로 일이 굴러간다 — 자기 전·출근 전에 AI를 돌려두고, 아침에 결과를 확인·평가한다
  2) 멀티태스킹 부하가 사람에게 옮겨온다 — 여러 에이전트가 동시에 돌며 머리가 아파온다
  3) 시간은 줄지 않는다, 분량이 늘어난다 — 같은 8시간에 처리하는 양이 몇 배가 된다
  4) 손보다 지시가 길어진다 — 직접 만드는 시간보다 context / 지시서를 정리하는 시간이 더 길어진다
  5) 역할이 이동한다 — "만드는 사람"에서 "평가하고 결정하는 사람"으로
- 직군별 적용 시나리오 한 줄씩 (직장인 / 인사 / 마케터 / 디자이너 / 자영업 / 예비창업가 / 학생)

## 2. 환경 — VS Code as Cockpit
- AI 환경 설정 (Claude Code + VS Code 동작 체크 / 사전 과제 claude-setup 점검 / GitHub 가입 + gh cli auth login)
- VS Code Cockpit — VS Code는 코딩 화면이 아니라 작업 조종석. Claude Code가 파일을 바꾸고, 터미널이 실행하고, Git이 기록하고, Preview가 결과를 보여준다. 4개의 공간만 먼저 익힌다.
  · Explorer: 파일과 폴더를 보는 공간
  · Terminal: 명령을 실행하는 공간
  · Source Control: 변경 이력을 보는 공간
  · Preview/Browser: 산출물을 확인하는 공간
- 실습 — Cockpit 첫 동작
  1) Week1_first_folder 폴더를 만든다
  2) VS Code에서 해당 폴더를 연다
  3) Claude Code에게 현재 어떤 폴더에 있는지 물어본다
  4) VS Code extension 무엇이 설치되어 있는지 물어본다
  5) md 파일로 정리해 달라고 한다

## 3. AI Native 문서 작업
- 개념: AI Native — Word / PPT / HWP를 안 쓰는 이유 (AI가 다루지 못함)
- 개념: Markdown — AI도 잘 쓰고 사람도 보기 좋음, 빠른 작업/확장에 유리 (VS Code extension render mode)
- 실습: 마크다운 사용 tutorial을 markdown으로 작성해 달라고 요청
- 개념: Mermaid — md는 텍스트, 도표가 필요할 때 mermaid 사용 (VS Code extension)
- 실습: mermaid 도식 그리고 png로 저장해 달라고 요청
- Markmap extension — mermaid mindmap 그리기
- 개념: HTML as Artifact — Markdown은 원고이고 HTML은 산출물. HTML은 브라우저만 있으면 열린다. 웹 페이지로 배포가 가능하다. 오늘 HTML을 배우는 이유는 웹 개발자가 되기 위해서가 아니라, AI가 만든 결과물을 직접 열고 확인할 수 있어야 하기 때문.

## 4. AI vs Agent — 작업 도구 이해
- 개념: AI는 무엇인가? Agent는 무엇인가? (에이전트의 전통적 의미)
- 개념: Web vs Desktop App vs Claude Code — 언제 무엇을
- 실습: 같은 요청을 Web / Desktop App / Claude Code에서 각각 돌려 비교
- Claude Code 주요 명령어 — 전체 리스트 → 자주 쓰는 5개
- 개념: Claude Code 핵심 자산 — CLAUDE.md / agent / skill / agent.md (Anthropic skill creator)

## 5. Working Framework — 에이전틱 6단계
- 기본 작업 방식 — 프로젝트 폴더 만들기 → VS Code에서 열기 → AI와 초안부터 시작하기
- 에이전틱 프레임워크 6단계: 구체화(브레인스톰/할일) → context 정리 → plan → 실행 → 평가 → iteration
- 개념: design.md — 디자인 취향 / 참고 사이트 / 컬러 / 톤
- 개념: Plan 먼저 받는 습관 — 실행 전에 "어떻게 만들지 plan부터 보여줘" 후 검토/수정

## 6. Building Blocks — Agent / Skill 직접 다루기
- 실습: Claude Code agent 만들기 (명함 agent)
- 실습: Claude Code skill 사용 — playwriter 설치하고 써보기

## 7. 한 사이클 통합 실습 — 프로필 사이트
- 바이브 코딩으로 에이전틱 프레임워크 한 사이클 — 프로필 사이트 만들기
  · 구체화: 본인이 만들 1페이지 HTML 사이트 1개 결정 (HR 팀 소개 / 1인 창업 랜딩 / 학생 포트폴리오 / 자영업 메뉴 등)
  · context: CLAUDE.md + design.md로 묶기
  · plan: Claude Code에게 plan 먼저 받아 검토
  · 실행: 핵심 plan 진행
- 평가 — "HTML 1페이지 5개 variation 만들어줘" → 베스트 1개 선정
- Iteration — 개선점 1~2개를 design skill로 응축해 Claude Code에 등록
- skill 적용 → 재생성 → 결과 비교
  · 산출물: 본인의 첫 HTML 페이지 + 본인의 첫 design skill

## 8. 배포 — Git / GitHub (마지막 15분)
- git / GitHub / commit / push / .gitignore 설명
- GitHub CLI로 내 프로젝트 올리고 GitHub Pages로 배포하기

## 9. 마무리
- Recap — Working framework 6단계 되짚기 + 학습 목표 3개 대비 점검 + Q&A
- 과제 안내 — 본인 업무 기반 "지시서 1건" 작성 (오늘 만든 design.md / CLAUDE.md 발전) · 다음 주 W2 Tooling 예고
