// We have a grid of n * n cells
// Note: numbers are used to represent the cells for simplicity
List<List<String>> grid = [
  ["1", "2", "3"],
  ["4", "5", "6"],
  ["7", "8", "9"]
];

bool hasWon(int row, int col) {
  return _checkRow(row) || _checkCol(col) || _checkDiagonal(row, col);
}

// check if all cells in the row of the selected cell are the same and not empty
// if the row of the selected cell row = 2 then we should check if (2,0), (2,1), (2,2) are the same
bool _checkRow(int row) {
  for (int i = 0; i < grid.length; i++) {
    if (_isEmpty(grid[row][i])) return false;
    if (grid[row][i] != grid[row][0]) return false;
  }
  return true;
}

// check if all cells in the column of the selected cell are the same and not empty
// if the column of the selected cell column = 2 then we should check if (0,2), (1,2), (2,2) are the same
bool _checkCol(int col) {
  for (int i = 0; i < grid.length; i++) {
    if (_isEmpty(grid[i][col])) return false;
    if (grid[i][col] != grid[0][col]) return false;
  }
  return true;
}

// check if all cells in the main diagonal or the anti diagonal are the same and not empty
// if the selected cell is in the main diagonal then we should check if (0,0), (1,1), (2,2) are the same
// if the selected cell is in the anti diagonal then we should check if (0,2), (1,1), (2,0) are the same
bool _checkDiagonal(int row, int col) {
  if (_isMainDiagonal(row, col)) return _checkMainDiagonal();
  if (_isAntiDiagonal(row, col)) return _checkAntiDiagonal();
  return false;
}

bool _isMainDiagonal(int row, int col) {
  return row == col;
}

bool _isAntiDiagonal(int row, int col) {
  return row + col == grid.length - 1;
}

_checkMainDiagonal() {
  for (int i = 0; i < grid.length; i++) {
    if (_isEmpty(grid[i][i])) return false;
    if (grid[i][i] != grid[0][0]) return false;
  }
  return true;
}

_checkAntiDiagonal() {
  for (int i = 0; i < grid.length; i++) {
    if (_isEmpty(grid[i][grid.length - 1 - i])) return false;
    if (grid[i][grid.length - 1 - i] != grid[0][grid.length - 1]) return false;
  }
  return true;
}

bool _isEmpty(String cell) {
  return cell == "";
}
