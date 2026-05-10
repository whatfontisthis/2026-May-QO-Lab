# Mermaid 예제 — 에이전틱 6단계 워크플로

> 텍스트로 그리는 도식. VS Code Mermaid extension 미리보기로 확인.
> 안정적으로 그려지는 타입: flowchart / sequence / gantt / mindmap.

---

## 1. Flowchart — 6단계 작업 흐름

```mermaid
flowchart TD
    A[구체화<br/>브레인스톰 / 할일] --> B[context 정리<br/>CLAUDE.md]
    B --> C[plan 요청<br/>Shift + Tab 두 번]
    C --> D{plan OK?}
    D -- No --> C
    D -- Yes --> E[실행]
    E --> F[평가<br/>5개 variation 비교]
    F --> G{만족?}
    G -- No --> H[iteration<br/>skill / 지시서 보강]
    H --> C
    G -- Yes --> I[배포<br/>git push · Pages]
```

---

## 2. Sequence — 사용자 ↔ Claude Code ↔ Git 흐름

```mermaid
sequenceDiagram
    actor User as 수강생
    participant CC as Claude Code
    participant FS as 로컬 폴더
    participant GH as GitHub

    User->>CC: "1페이지 사이트 plan부터 보여줘"
    CC-->>User: plan 초안 제시
    User->>CC: OK, 실행해줘
    CC->>FS: index.html 생성
    CC-->>User: 결과 보고
    User->>CC: "git에 올려줘"
    CC->>FS: git add · commit
    CC->>GH: git push
    GH-->>User: 공개 URL
```

---

## 3. Gantt — Week 1 ~ Week 4 일정

```mermaid
gantt
    title Quiet Operators Lab — 4주 커리큘럼
    dateFormat  YYYY-MM-DD
    axisFormat  %m/%d

    section Week 1
    Foundation 수업       :done,  w1a, 2026-05-09, 1d
    Recap 영상 녹화       :active, w1b, 2026-05-10, 2d
    과제 제출            :        w1c, 2026-05-12, 3d

    section Week 2
    Tooling 수업         :        w2a, 2026-05-16, 1d
    Office Hour          :        w2b, 2026-05-18, 4d

    section Week 3
    Orchestration 수업   :        w3a, 2026-05-23, 1d
    프로젝트 작업        :        w3b, 2026-05-24, 6d

    section Week 4
    Demo Day             :crit,   w4a, 2026-05-30, 1d
```

---

## 4. State diagram — Claude Code 작업 모드

```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Planning: Shift+Tab x2
    Planning --> Reviewing: plan 출력
    Reviewing --> Planning: 수정 요청
    Reviewing --> Executing: OK
    Executing --> Evaluating: 산출물 생성
    Evaluating --> Idle: 만족
    Evaluating --> Planning: 재작업
    Executing --> Idle: Esc (중단)
```

---

## png로 저장하려면

Claude Code에 다음과 같이 요청:

```
이 mermaid 도식을 png로 저장해줘
```

같은 폴더에 `.png` 파일이 생성된다.
