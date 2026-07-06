const $ = (selector, root = document) => root.querySelector(selector);
const $$ = (selector, root = document) => Array.from(root.querySelectorAll(selector));
const money = new Intl.NumberFormat("ko-KR");

const ASSETS = new URL("src/main/webapp/resources/assets/img/", document.baseURI).href;

const movies = [
  {
    id: "bando",
    title: "반도",
    genre: "액션",
    runtime: "116분",
    grade: "15세",
    score: 8.7,
    poster: `${ASSETS}poster01@2.jpg`,
    hero: `${ASSETS}main_slider01_2000.jpg`,
    logline: "폐허가 된 도시에서 마지막 탈출 작전을 벌이는 액션 블록버스터.",
    tags: ["IMAX", "Dolby", "자막"]
  },
  {
    id: "aladdin",
    title: "알라딘",
    genre: "판타지",
    runtime: "128분",
    grade: "전체",
    score: 9.1,
    poster: `${ASSETS}poster02@2.jpg`,
    hero: `${ASSETS}main_slider02_2000.jpg`,
    logline: "음악과 모험, 가족 관람 수요를 동시에 잡는 판타지 뮤지컬.",
    tags: ["가족", "더빙", "Sing-along"]
  },
  {
    id: "bluehour",
    title: "블루아워",
    genre: "드라마",
    runtime: "92분",
    grade: "12세",
    score: 8.4,
    poster: `${ASSETS}poster03@2.jpg`,
    hero: `${ASSETS}main_slider03_2000.jpg`,
    logline: "일상과 여행 사이에서 관계의 온도를 따라가는 섬세한 드라마.",
    tags: ["아트", "GV", "소규모관"]
  },
  {
    id: "bombshell",
    title: "밤쉘",
    genre: "드라마",
    runtime: "109분",
    grade: "15세",
    score: 8.2,
    poster: `${ASSETS}poster04@2.jpg`,
    hero: `${ASSETS}movie.jpg`,
    logline: "조직과 권력, 침묵을 깨는 사람들의 이야기를 다룬 실화 기반 드라마.",
    tags: ["실화", "프리미어", "리뷰"]
  }
];

const branches = [
  { id: "gangnam", name: "LCB 강남", screens: 7 },
  { id: "hongdae", name: "LCB 홍대", screens: 5 },
  { id: "ilsan", name: "LCB 일산벨라시타", screens: 4 }
];

const showtimes = [
  { id: "S101", movieId: "bando", branchId: "gangnam", screen: "1관", time: "10:20", format: "2D", sold: 46, capacity: 70, price: 12000 },
  { id: "S102", movieId: "bando", branchId: "gangnam", screen: "1관", time: "14:20", format: "Dolby", sold: 61, capacity: 70, price: 15000 },
  { id: "S103", movieId: "bando", branchId: "hongdae", screen: "2관", time: "20:30", format: "2D", sold: 52, capacity: 70, price: 13000 },
  { id: "S201", movieId: "aladdin", branchId: "hongdae", screen: "3관", time: "13:10", format: "더빙", sold: 34, capacity: 70, price: 12000 },
  { id: "S202", movieId: "aladdin", branchId: "gangnam", screen: "4관", time: "19:50", format: "Sing-along", sold: 57, capacity: 70, price: 14000 },
  { id: "S301", movieId: "bluehour", branchId: "ilsan", screen: "2관", time: "15:10", format: "2D", sold: 22, capacity: 70, price: 11000 },
  { id: "S302", movieId: "bluehour", branchId: "gangnam", screen: "5관", time: "21:10", format: "GV", sold: 41, capacity: 70, price: 14000 },
  { id: "S401", movieId: "bombshell", branchId: "hongdae", screen: "1관", time: "18:30", format: "2D", sold: 39, capacity: 70, price: 12000 }
];

const seatRows = ["A", "B", "C", "D", "E", "F", "G"];
const baseSoldSeats = new Set(["A3", "A4", "B8", "C2", "D7", "E1", "F9", "G10"]);
const holdMinutes = 4;
const seatZoneByRow = {
  A: "premium",
  B: "premium",
  C: "standard",
  D: "standard",
  E: "standard",
  F: "economy",
  G: "economy"
};
const zoneMeta = {
  premium: { label: "프리미엄", surcharge: 3000 },
  standard: { label: "스탠다드", surcharge: 0 },
  economy: { label: "이코노미", surcharge: -1000 }
};
const dayLabels = {
  today: "오늘",
  tomorrow: "내일",
  weekend: "이번 주말"
};

const storeItems = [
  { id: "combo", title: "시그니처 콤보", desc: "카라멜 팝콘 L + 탄산 2잔", price: 15500, img: `${ASSETS}card01@2.jpg` },
  { id: "cheese", title: "더블 치즈 팝콘", desc: "치즈 시즈닝과 고소한 팝콘", price: 8500, img: `${ASSETS}card02@2.jpg` },
  { id: "zero", title: "제로 탄산 세트", desc: "제로 콜라 2잔과 얼음컵", price: 6500, img: `${ASSETS}card03@2.jpg` },
  { id: "ticket", title: "관람권 패키지", desc: "주중 관람권 2매와 스낵 쿠폰", price: 24000, img: `${ASSETS}event04@2.jpg` }
];

const defaultState = {
  route: "catalog",
  search: "",
  branch: "all",
  day: "today",
  selectedMovieId: "bando",
  selectedShowId: "S101",
  party: 2,
  selectedSeats: ["C5", "C6"],
  holdExpiresAt: Date.now() + holdMinutes * 60 * 1000,
  tickets: [
    {
      id: "T20260701",
      showId: "S202",
      movieId: "aladdin",
      branch: "LCB 강남",
      screen: "4관",
      time: "내일 19:50",
      seats: ["D4", "D5"],
      price: 27600,
      status: "결제 승인",
      paymentKey: "PAY-20260701-ALADDIN",
      refundUntil: "상영 20분 전"
    }
  ],
  cart: {},
  posts: [
    { type: "공지", title: "주말 심야 상영 회차 추가", desc: "강남과 홍대 지점의 심야 회차가 추가되었습니다.", status: "게시중" },
    { type: "Q&A", title: "예매 취소는 언제까지 가능한가요?", desc: "상영 20분 전까지 마이페이지에서 직접 취소할 수 있습니다.", status: "답변 완료" },
    { type: "분실물", title: "일산 3관 검은색 카드지갑", desc: "상영 종료 후 접수된 분실물을 보관 중입니다.", status: "보관중" }
  ],
  chat: [
    { user: "min", text: "입장했습니다. 화면 잘 보여요.", mine: false },
    { user: "lcb", text: "상영 전 채팅 연결 상태 확인 중입니다.", mine: true },
    { user: "seo", text: "같이 보기 기능은 영화관 서비스랑 잘 맞네요.", mine: false }
  ]
};

let state = loadState();

function loadState() {
  try {
    return { ...defaultState, ...JSON.parse(localStorage.getItem("lcbCinemaState") || "{}") };
  } catch {
    return { ...defaultState };
  }
}

function saveState() {
  localStorage.setItem("lcbCinemaState", JSON.stringify({
    selectedMovieId: state.selectedMovieId,
    selectedShowId: state.selectedShowId,
    party: state.party,
    selectedSeats: state.selectedSeats,
    holdExpiresAt: state.holdExpiresAt,
    tickets: state.tickets,
    cart: state.cart,
    posts: state.posts,
    chat: state.chat
  }));
}

function movie(id = state.selectedMovieId) {
  return movies.find((item) => item.id === id) || movies[0];
}

function branch(id) {
  return branches.find((item) => item.id === id) || branches[0];
}

function show(id = state.selectedShowId) {
  return showtimes.find((item) => item.id === id) || showtimes[0];
}

function routeTo(route) {
  state.route = route;
  location.hash = route;
  render();
}

function filteredMovies() {
  const query = state.search.toLowerCase();
  return movies.filter((item) => `${item.title} ${item.genre} ${item.tags.join(" ")}`.toLowerCase().includes(query));
}

function filteredShows() {
  return showtimes.filter((item) => {
    const byBranch = state.branch === "all" || item.branchId === state.branch;
    const bySearch = !state.search || movie(item.movieId).title.includes(state.search) || branch(item.branchId).name.includes(state.search);
    return byBranch && bySearch;
  });
}

function soldSeatsForCurrentShow() {
  const sold = new Set(baseSoldSeats);
  state.tickets.filter((ticket) => ticket.showId === state.selectedShowId && !ticket.status.includes("취소")).forEach((ticket) => {
    ticket.seats.forEach((seat) => sold.add(seat));
  });
  return sold;
}

function dayLabel() {
  return dayLabels[state.day] || dayLabels.today;
}

function seatZone(seat) {
  return zoneMeta[seatZoneByRow[seat.charAt(0)] || "standard"];
}

function timePolicy(item = show()) {
  const hour = Number(item.time.split(":")[0]);
  if (hour < 12) return { label: "조조 할인", amount: -2000 };
  if (hour >= 20) return { label: "심야 할증", amount: 1000 };
  return { label: "일반 시간", amount: 0 };
}

function priceForSeat(seat, item = show()) {
  return Math.max(9000, item.price + seatZone(seat).surcharge + timePolicy(item).amount);
}

function priceBreakdown(seats = state.selectedSeats, item = show()) {
  const orderedSeats = [...seats].sort();
  const base = orderedSeats.length * item.price;
  const zone = orderedSeats.reduce((sum, seat) => sum + seatZone(seat).surcharge, 0);
  const time = orderedSeats.length * timePolicy(item).amount;
  const subtotal = orderedSeats.reduce((sum, seat) => sum + priceForSeat(seat, item), 0);
  const memberDiscount = orderedSeats.length ? Math.floor(subtotal * 0.05) : 0;
  const serviceFee = orderedSeats.length ? 1000 : 0;
  return {
    base,
    zone,
    time,
    subtotal,
    memberDiscount,
    serviceFee,
    total: Math.max(0, subtotal - memberDiscount + serviceFee)
  };
}

function resetHold() {
  state.holdExpiresAt = null;
}

function startHold() {
  state.holdExpiresAt = Date.now() + holdMinutes * 60 * 1000;
}

function isHoldActive() {
  return Boolean(state.holdExpiresAt && state.holdExpiresAt > Date.now());
}

function holdRemainingText() {
  if (!state.holdExpiresAt) return "좌석을 선택하면 선점 타이머가 시작됩니다.";
  const diff = Math.max(0, state.holdExpiresAt - Date.now());
  const minutes = String(Math.floor(diff / 60000)).padStart(2, "0");
  const seconds = String(Math.floor((diff % 60000) / 1000)).padStart(2, "0");
  return `${minutes}:${seconds}`;
}

function releaseExpiredHold() {
  if (state.selectedSeats.length && state.holdExpiresAt && state.holdExpiresAt <= Date.now()) {
    state.selectedSeats = [];
    resetHold();
    saveState();
  }
}

function toast(message) {
  const node = $("#toast");
  node.textContent = message;
  node.classList.add("show");
  window.clearTimeout(toast.timer);
  toast.timer = window.setTimeout(() => node.classList.remove("show"), 2300);
}

function viewHead(title, desc, action = "") {
  return `
    <div class="view-head">
      <div>
        <h1>${title}</h1>
        <p>${desc}</p>
      </div>
      ${action}
    </div>
  `;
}

function render() {
  releaseExpiredHold();
  $$(".nav a").forEach((link) => link.classList.toggle("active", link.dataset.route === state.route));
  $("#searchInput").value = state.search;
  $("#branchInput").value = state.branch;
  $("#dayInput").value = state.day;

  const routes = {
    catalog: renderCatalog,
    booking: renderBooking,
    tickets: renderTickets,
    store: renderStore,
    community: renderCommunity,
    watch: renderWatch,
    ops: renderOps
  };
  (routes[state.route] || renderCatalog)();
  renderInspector();
}

function renderCatalog() {
  const selected = movie();
  const shows = filteredShows();
  $("#view").innerHTML = `
    ${viewHead("영화 / 시간표", "상영작 탐색, 지점별 회차, 예매 진입까지 한 화면에서 처리합니다.", `<button class="btn primary" data-go="booking">예매 시작</button>`)}
    <section class="panel hero-board" style="--hero-image:url('${selected.hero}')">
      <div>
        <p class="eyebrow">Now showing</p>
        <h2>${selected.title}</h2>
        <p>${selected.logline}</p>
        <div class="actions">
          <button class="btn primary" data-go="booking">이 영화 예매</button>
          <button class="btn dark" data-go="watch">같이 보기 채팅</button>
        </div>
      </div>
    </section>

    <div class="section-title">
      <h2>상영작</h2>
      <span class="muted">${filteredMovies().length}편</span>
    </div>
    <section class="grid four">
      ${filteredMovies().map(renderMovieCard).join("")}
    </section>

    <div class="section-title">
      <h2>오늘의 회차</h2>
      <span class="muted">${shows.length}개 회차</span>
    </div>
    <section class="timeline">
      ${shows.map(renderTimeRow).join("")}
    </section>
  `;
}

function renderMovieCard(item) {
  return `
    <article class="movie-card">
      <img src="${item.poster}" alt="${item.title} 포스터">
      <div class="body">
        <h3>${item.title}</h3>
        <div class="meta"><span>${item.genre}</span><span>${item.runtime}</span><span>평점 ${item.score}</span></div>
        <div class="actions">
          <button class="btn" data-select-movie="${item.id}">상세</button>
          <button class="btn primary" data-book-movie="${item.id}">예매</button>
        </div>
      </div>
    </article>
  `;
}

function renderTimeRow(item) {
  const itemMovie = movie(item.movieId);
  const occupancy = Math.round((item.sold / item.capacity) * 100);
  return `
    <article class="time-row">
      <strong>${item.time}</strong>
      <div>
        <h3>${itemMovie.title}</h3>
        <div class="meta"><span>${branch(item.branchId).name}</span><span>${item.screen}</span><span>${item.format}</span></div>
      </div>
      <div><div class="progress"><span style="width:${occupancy}%"></span></div><span class="muted">${occupancy}%</span></div>
      <button class="btn" data-book-show="${item.id}">선택</button>
    </article>
  `;
}

function renderBooking() {
  const currentShow = show();
  const currentMovie = movie(currentShow.movieId);
  const sold = soldSeatsForCurrentShow();
  $("#view").innerHTML = `
    ${viewHead("빠른 예매", "영화와 회차를 고르고 인원 수만큼 좌석을 선택하면 예매 내역이 생성됩니다.")}
    <section class="booking-layout">
      <aside class="panel pad form-stack">
        <div class="field">
          <label for="bookingMovie">영화</label>
          <select id="bookingMovie">${movies.map((item) => `<option value="${item.id}" ${item.id === currentMovie.id ? "selected" : ""}>${item.title}</option>`).join("")}</select>
        </div>
        <div class="field">
          <label for="partyInput">인원</label>
          <select id="partyInput">${[1, 2, 3, 4].map((count) => `<option value="${count}" ${count === Number(state.party) ? "selected" : ""}>성인 ${count}명</option>`).join("")}</select>
        </div>
        <div class="policy-grid">
          <span><strong>${holdMinutes}분</strong><br>좌석 선점</span>
          <span><strong>${timePolicy(currentShow).label}</strong><br>${money.format(timePolicy(currentShow).amount)}원</span>
          <span><strong>5%</strong><br>멤버십 할인</span>
          <span><strong>20분 전</strong><br>취소 가능</span>
        </div>
        <div class="field">
          <label>회차</label>
          <div class="showtime-grid">
            ${showtimes.filter((item) => item.movieId === currentMovie.id).map((item) => `
              <button class="showtime-card" data-book-show="${item.id}" aria-pressed="${item.id === state.selectedShowId}">
                <strong>${item.time}</strong><br>
                <span>${branch(item.branchId).name} · ${item.screen}</span><br>
                <span>${item.format}</span>
              </button>
            `).join("")}
          </div>
        </div>
      </aside>

      <section class="panel pad">
        <div class="screen">SCREEN · ${branch(currentShow.branchId).name} ${currentShow.screen}</div>
        <div class="hold-banner ${state.selectedSeats.length ? "active" : ""}">
          <strong>좌석 선점</strong>
          <span>${state.selectedSeats.length ? `${holdRemainingText()} 남음` : "좌석을 선택하면 결제 전 임시 점유가 시작됩니다."}</span>
        </div>
        <div class="seat-map">
          ${seatRows.flatMap((row) => Array.from({ length: 10 }, (_, idx) => {
            const id = `${row}${idx + 1}`;
            const selected = state.selectedSeats.includes(id);
            const zone = seatZoneByRow[row] || "standard";
            return `<button class="seat zone-${zone}" data-seat="${id}" aria-pressed="${selected}" title="${seatZone(id).label} ${money.format(priceForSeat(id, currentShow))}원" ${sold.has(id) ? "disabled" : ""}>${id}</button>`;
          })).join("")}
        </div>
        <div class="legend">
          <span><i class="dot"></i>선택 가능</span>
          <span><i class="dot premium"></i>프리미엄</span>
          <span><i class="dot economy"></i>이코노미</span>
          <span><i class="dot selected"></i>선택됨</span>
          <span><i class="dot sold"></i>예매 완료</span>
        </div>
      </section>
    </section>
  `;
}

function renderTickets() {
  $("#view").innerHTML = `
    ${viewHead("내 예매", "확정된 예매권, 좌석, 지점, 취소 가능 상태를 확인합니다.")}
    <section class="grid">
      ${state.tickets.length ? state.tickets.map(renderTicket).join("") : `<div class="panel pad"><p class="muted">아직 예매 내역이 없습니다.</p><button class="btn primary" data-go="booking">예매하기</button></div>`}
    </section>
  `;
}

function renderTicket(ticket) {
  const item = movie(ticket.movieId);
  const cancelled = ticket.status.includes("취소");
  return `
    <article class="ticket">
      <img src="${item.poster}" alt="${item.title} 포스터">
      <div>
        <h3>${item.title}</h3>
        <p class="muted">${ticket.branch} · ${ticket.screen} · ${ticket.time} · ${ticket.seats.join(", ")}</p>
        <span class="badge teal">${ticket.id}</span>
        <span class="badge ${cancelled ? "red" : ""}">${ticket.status}</span>
        <div class="summary-row compact"><span>결제 금액</span><strong>${money.format(ticket.price)}원</strong></div>
        <div class="summary-row compact"><span>환불 기준</span><strong>${ticket.refundUntil || "상영 20분 전"}</strong></div>
        ${cancelled ? "" : `<button class="btn" data-cancel-ticket="${ticket.id}">취소/환불</button>`}
      </div>
      <div class="qr" aria-label="티켓 코드">${Array.from({ length: 25 }, (_, index) => `<i style="opacity:${(index + ticket.id.length) % 3 ? 1 : .18}"></i>`).join("")}</div>
    </article>
  `;
}

function renderStore() {
  $("#view").innerHTML = `
    ${viewHead("스토어", "상영 전 픽업할 스낵을 장바구니에 담고 주문 흐름을 확인합니다.")}
    <section class="grid three">
      ${storeItems.map((item) => `
        <article class="store-card">
          <img src="${item.img}" alt="${item.title}">
          <div class="body">
            <h3>${item.title}</h3>
            <p class="muted">${item.desc}</p>
            <div class="summary-row"><span>${money.format(item.price)}원</span><button class="btn" data-cart="${item.id}">담기</button></div>
          </div>
        </article>
      `).join("")}
    </section>
  `;
}

function renderCommunity() {
  $("#view").innerHTML = `
    ${viewHead("고객 게시판", "공지, Q&A, 분실물 문의를 등록하고 처리 상태를 확인합니다.")}
    <section class="grid">
      ${state.posts.map((post, index) => `
        <article class="board-item">
          <span class="badge ${post.type === "공지" ? "red" : ""}">${post.type}</span>
          <div>
            <h3>${post.title}</h3>
            <p class="muted">${post.desc}</p>
          </div>
          <strong>${post.status}</strong>
        </article>
      `).join("")}
    </section>
  `;
}

function renderWatch() {
  $("#view").innerHTML = `
    ${viewHead("같이 보기", "상영 영상과 실시간 채팅을 나란히 구성한 관람방 화면입니다.")}
    <section class="watch-layout">
      <div class="video-box">
        <iframe src="https://www.youtube.com/embed/PVP5ZJuI57c?autoplay=0" title="LCB 같이 보기 영상" allowfullscreen></iframe>
      </div>
      <aside class="panel pad form-stack">
        <div>
          <h2>관람방 채팅</h2>
          <p class="muted">서버 앱에서는 Spring WebSocket/SockJS `/echo` endpoint와 연결됩니다.</p>
        </div>
        <div class="chat-list" id="chatList">${state.chat.map((msg) => `<div class="chat-msg ${msg.mine ? "mine" : ""}"><strong>${msg.user}</strong><br>${msg.text}</div>`).join("")}</div>
        <div class="field">
          <label for="chatInput">메시지</label>
          <input id="chatInput" type="text" value="이 장면 연출 좋네요">
        </div>
        <button class="btn primary" id="sendChat">전송</button>
      </aside>
    </section>
  `;
  $("#chatList").scrollTop = $("#chatList").scrollHeight;
}

function renderOps() {
  const rows = showtimes.map((item) => {
    const itemMovie = movie(item.movieId);
    const reservedSeats = state.tickets
      .filter((ticket) => ticket.showId === item.id && !ticket.status.includes("취소"))
      .reduce((sum, ticket) => sum + ticket.seats.length, 0);
    const occupancy = Math.round(((item.sold + reservedSeats) / item.capacity) * 100);
    return `<tr><td>${itemMovie.title}</td><td>${branch(item.branchId).name}</td><td>${item.time}</td><td><div class="progress"><span style="width:${occupancy}%"></span></div>${occupancy}%</td></tr>`;
  }).join("");
  const activeTickets = state.tickets.filter((ticket) => !ticket.status.includes("취소"));
  const cancelledTickets = state.tickets.filter((ticket) => ticket.status.includes("취소"));
  const revenue = activeTickets.reduce((sum, ticket) => sum + ticket.price, 0);
  const heldSeats = state.selectedSeats.length && isHoldActive() ? state.selectedSeats.length : 0;
  $("#view").innerHTML = `
    ${viewHead("운영 콘솔", "상영 회차 점유율, 문의 처리, 스토어 픽업 상태를 운영자 관점으로 확인합니다.")}
    <section class="metric-grid">
      <div class="metric-card"><span>결제 승인</span><strong>${activeTickets.length}건</strong><em>${money.format(revenue)}원</em></div>
      <div class="metric-card"><span>취소 완료</span><strong>${cancelledTickets.length}건</strong><em>좌석 반환 반영</em></div>
      <div class="metric-card"><span>임시 선점</span><strong>${heldSeats}석</strong><em>${heldSeats ? holdRemainingText() : "대기 없음"}</em></div>
      <div class="metric-card"><span>문의 처리</span><strong>${state.posts.filter((post) => post.status === "접수").length}건</strong><em>우선 답변 필요</em></div>
    </section>
    <section class="ops-grid">
      <div class="panel pad">
        <h2>회차 점유율</h2>
        <table>
          <thead><tr><th>영화</th><th>지점</th><th>시간</th><th>점유율</th></tr></thead>
          <tbody>${rows}</tbody>
        </table>
      </div>
      <div class="grid">
        <div class="panel pad">
          <h2>좌석 히트맵</h2>
          <div class="heatmap">${seatRows.map((row, index) => `<span style="opacity:${0.58 + index * 0.06}">${row}</span>`).join("")}</div>
        </div>
        <div class="panel pad grid">
          <h2>오늘 처리할 일</h2>
          <div class="task-row"><span class="badge">스토어</span><strong>픽업 대기 8건</strong><span class="muted">팝콘 재고 확인</span></div>
          <div class="task-row"><span class="badge">Q&A</span><strong>답변 대기 3건</strong><span class="muted">환불, 좌석 변경</span></div>
          <div class="task-row"><span class="badge red">상영</span><strong>20:30 회차 매진 임박</strong><span class="muted">잔여 9석</span></div>
        </div>
      </div>
    </section>
  `;
}

function renderInspector() {
  const currentMovie = movie();
  const currentShow = show();
  if (state.route === "booking") {
    const seats = [...state.selectedSeats].sort();
    const pricing = priceBreakdown(seats, currentShow);
    const time = timePolicy(currentShow);
    $("#inspector").innerHTML = `
      <img src="${currentMovie.hero}" alt="${currentMovie.title} 스틸컷">
      <p class="eyebrow">Booking summary</p>
      <h2>${currentMovie.title}</h2>
      <div class="summary-row"><span>지점</span><strong>${branch(currentShow.branchId).name}</strong></div>
      <div class="summary-row"><span>상영관</span><strong>${currentShow.screen} · ${currentShow.format}</strong></div>
      <div class="summary-row"><span>시간</span><strong>${dayLabel()} ${currentShow.time}</strong></div>
      <div class="summary-row"><span>인원</span><strong>${state.party}명</strong></div>
      <div class="summary-row"><span>좌석</span><strong>${seats.length ? seats.join(", ") : "선택 전"}</strong></div>
      <div class="summary-row"><span>선점</span><strong>${seats.length ? holdRemainingText() : "대기"}</strong></div>
      <div class="price-stack">
        <div class="summary-row"><span>기본가</span><strong>${money.format(pricing.base)}원</strong></div>
        <div class="summary-row"><span>좌석 등급</span><strong>${money.format(pricing.zone)}원</strong></div>
        <div class="summary-row"><span>${time.label}</span><strong>${money.format(pricing.time)}원</strong></div>
        <div class="summary-row"><span>멤버십 할인</span><strong>-${money.format(pricing.memberDiscount)}원</strong></div>
        <div class="summary-row"><span>예매 수수료</span><strong>${money.format(pricing.serviceFee)}원</strong></div>
        <div class="summary-row total"><span>결제 예정</span><strong>${money.format(pricing.total)}원</strong></div>
      </div>
      <p class="muted small-note">좌석은 ${holdMinutes}분간 임시 점유되며 결제 승인 후 예매권으로 전환됩니다. 취소는 상영 20분 전까지 가능합니다.</p>
      <button class="btn primary" id="confirmBooking">예매 확정</button>
    `;
    return;
  }

  if (state.route === "store") {
    const entries = Object.entries(state.cart);
    const total = entries.reduce((sum, [id, count]) => sum + storeItems.find((item) => item.id === id).price * count, 0);
    $("#inspector").innerHTML = `
      <p class="eyebrow">Store cart</p>
      <h2>장바구니</h2>
      <div class="grid">
        ${entries.length ? entries.map(([id, count]) => {
          const item = storeItems.find((entry) => entry.id === id);
          return `<div class="cart-line"><span>${item.title} x ${count}</span><strong>${money.format(item.price * count)}원</strong></div>`;
        }).join("") : `<p class="muted">담긴 상품이 없습니다.</p>`}
      </div>
      <div class="summary-row"><span>합계</span><strong>${money.format(total)}원</strong></div>
      <button class="btn primary" id="checkoutStore">픽업 주문</button>
    `;
    return;
  }

  if (state.route === "community") {
    $("#inspector").innerHTML = `
      <p class="eyebrow">New request</p>
      <h2>문의 등록</h2>
      <div class="form-stack">
        <div class="field"><label for="postType">분류</label><select id="postType"><option>Q&A</option><option>분실물</option><option>관람 문의</option></select></div>
        <div class="field"><label for="postTitle">제목</label><input id="postTitle" value="상영관 냉방 문의"></div>
        <div class="field"><label for="postBody">내용</label><textarea id="postBody">오늘 저녁 회차의 상영관 온도 조절이 가능한지 확인 부탁드립니다.</textarea></div>
        <button class="btn primary" id="submitPost">문의 등록</button>
      </div>
    `;
    return;
  }

  $("#inspector").innerHTML = `
    <img src="${currentMovie.hero}" alt="${currentMovie.title} 스틸컷">
    <p class="eyebrow">Movie detail</p>
    <h2>${currentMovie.title}</h2>
    <p>${currentMovie.logline}</p>
    <div class="meta">${currentMovie.tags.map((tag) => `<span class="badge">${tag}</span>`).join("")}</div>
    <div class="summary-row"><span>장르</span><strong>${currentMovie.genre}</strong></div>
    <div class="summary-row"><span>러닝타임</span><strong>${currentMovie.runtime}</strong></div>
    <div class="summary-row"><span>등급</span><strong>${currentMovie.grade}</strong></div>
    <div class="summary-row"><span>평점</span><strong>${currentMovie.score}</strong></div>
    <button class="btn primary" data-go="booking">예매하기</button>
  `;
}

function confirmBooking() {
  const seats = [...state.selectedSeats].sort();
  if (seats.length !== Number(state.party)) {
    toast(`인원 수(${state.party}명)에 맞게 좌석을 선택해주세요.`);
    return;
  }
  if (!isHoldActive()) {
    state.selectedSeats = [];
    resetHold();
    saveState();
    toast("좌석 선점 시간이 만료되었습니다. 다시 선택해주세요.");
    render();
    return;
  }
  const currentShow = show();
  const currentMovie = movie(currentShow.movieId);
  const pricing = priceBreakdown(seats, currentShow);
  const ticket = {
    id: `T${Date.now().toString().slice(-8)}`,
    showId: currentShow.id,
    movieId: currentMovie.id,
    branch: branch(currentShow.branchId).name,
    screen: currentShow.screen,
    time: `${dayLabel()} ${currentShow.time}`,
    seats,
    price: pricing.total,
    status: "결제 승인",
    holdId: `HOLD-${state.holdExpiresAt}`,
    paymentKey: `PAY-${currentShow.id}-${Date.now().toString().slice(-6)}`,
    refundUntil: "상영 20분 전"
  };
  state.tickets.unshift(ticket);
  state.selectedSeats = [];
  resetHold();
  saveState();
  toast("예매가 완료되었습니다. 내 예매에 반영했습니다.");
  render();
}

function cancelTicket(ticketId) {
  const ticket = state.tickets.find((item) => item.id === ticketId);
  if (!ticket || ticket.status.includes("취소")) return;
  ticket.status = "취소 완료";
  ticket.refundAmount = Math.floor(ticket.price * 0.95);
  saveState();
  toast(`${ticket.id} 예매를 취소하고 좌석을 반환했습니다.`);
  render();
}

document.addEventListener("click", (event) => {
  const route = event.target.closest("[data-go]")?.dataset.go || event.target.closest("[data-route]")?.dataset.route;
  if (route) {
    event.preventDefault();
    routeTo(route);
    return;
  }

  const movieId = event.target.closest("[data-select-movie]")?.dataset.selectMovie;
  if (movieId) {
    state.selectedMovieId = movieId;
    render();
    return;
  }

  const bookMovie = event.target.closest("[data-book-movie]")?.dataset.bookMovie;
  if (bookMovie) {
    state.selectedMovieId = bookMovie;
    const firstShow = showtimes.find((item) => item.movieId === bookMovie);
    state.selectedShowId = firstShow?.id || state.selectedShowId;
    state.selectedSeats = [];
    resetHold();
    routeTo("booking");
    return;
  }

  const showId = event.target.closest("[data-book-show]")?.dataset.bookShow;
  if (showId) {
    state.selectedShowId = showId;
    state.selectedMovieId = show(showId).movieId;
    state.selectedSeats = [];
    resetHold();
    routeTo("booking");
    return;
  }

  const seat = event.target.closest("[data-seat]");
  if (seat && !seat.disabled) {
    const id = seat.dataset.seat;
    if (state.selectedSeats.includes(id)) {
      state.selectedSeats = state.selectedSeats.filter((item) => item !== id);
    } else {
      if (state.selectedSeats.length >= Number(state.party)) {
        toast(`최대 ${state.party}석까지 선택할 수 있습니다.`);
        return;
      }
      state.selectedSeats.push(id);
      if (!isHoldActive()) startHold();
    }
    if (!state.selectedSeats.length) resetHold();
    saveState();
    render();
    return;
  }

  const ticketId = event.target.closest("[data-cancel-ticket]")?.dataset.cancelTicket;
  if (ticketId) {
    cancelTicket(ticketId);
    return;
  }

  const cartId = event.target.closest("[data-cart]")?.dataset.cart;
  if (cartId) {
    state.cart[cartId] = (state.cart[cartId] || 0) + 1;
    saveState();
    toast("장바구니에 담았습니다.");
    render();
    return;
  }

  if (event.target.closest("#confirmBooking")) {
    confirmBooking();
    return;
  }

  if (event.target.closest("#checkoutStore")) {
    if (!Object.keys(state.cart).length) {
      toast("상품을 먼저 담아주세요.");
      return;
    }
    state.cart = {};
    saveState();
    toast("스토어 픽업 주문이 접수되었습니다.");
    render();
  }

  if (event.target.closest("#submitPost")) {
    state.posts.unshift({
      type: $("#postType").value,
      title: $("#postTitle").value,
      desc: $("#postBody").value,
      status: "접수"
    });
    saveState();
    toast("문의가 등록되었습니다.");
    render();
  }

  if (event.target.closest("#sendChat")) sendChat();
});

document.addEventListener("change", (event) => {
  if (event.target.id === "branchInput") {
    state.branch = event.target.value;
    render();
  }
  if (event.target.id === "dayInput") {
    state.day = event.target.value;
    render();
  }
  if (event.target.id === "bookingMovie") {
    state.selectedMovieId = event.target.value;
    const firstShow = showtimes.find((item) => item.movieId === state.selectedMovieId);
    state.selectedShowId = firstShow?.id || state.selectedShowId;
    state.selectedSeats = [];
    resetHold();
    render();
  }
  if (event.target.id === "partyInput") {
    state.party = Number(event.target.value);
    state.selectedSeats = state.selectedSeats.slice(0, state.party);
    if (!state.selectedSeats.length) resetHold();
    saveState();
    render();
  }
});

$("#searchInput").addEventListener("input", (event) => {
  state.search = event.target.value.trim();
  render();
});

window.addEventListener("hashchange", () => {
  const next = location.hash.replace("#", "");
  if (next && next !== state.route) {
    state.route = next;
    render();
  }
});

function sendChat() {
  const input = $("#chatInput");
  if (!input || !input.value.trim()) return;
  state.chat.push({ user: "lcb", text: input.value.trim(), mine: true });
  saveState();
  render();
  toast("채팅 메시지를 전송했습니다.");
}

document.addEventListener("keydown", (event) => {
  if (event.key === "Enter" && event.target?.id === "chatInput") sendChat();
});

const initialRoute = location.hash.replace("#", "");
if (["catalog", "booking", "tickets", "store", "community", "watch", "ops"].includes(initialRoute)) {
  state.route = initialRoute;
}

render();

window.setInterval(() => {
  if (state.route === "booking" && state.selectedSeats.length) render();
}, 30000);
