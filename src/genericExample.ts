type ApiResponse<T> = {
  data: T;
  success: boolean;
};

function identity<T>(value: T): T {
  return value;
}

function firstItem<T>(items: T[]): T | undefined {
  return items[0];
}

const userResponse: ApiResponse<string> = {
  data: 'Emily',
  success: true,
};

const scoreResponse: ApiResponse<number> = {
  data: 92,
  success: true,
};

const firstTask = firstItem<string>([
  'Review protocols',
  'Practise generics',
  'Run tests',
]);

console.log(identity<string>('Generic identity example'));
console.log(userResponse);
console.log(scoreResponse);
console.log(firstTask);
