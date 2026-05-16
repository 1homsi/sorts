#!/usr/bin/env python3
import json
from pathlib import Path
import re

def remove_test_code(filename, content):
    """Remove test/main code intelligently based on file extension"""

    name = Path(filename).stem
    suffix = Path(filename).suffix.lower()

    # For Python
    if suffix == '.py':
        lines = content.split('\n')
        result = []
        for line in lines:
            if line.startswith('arr = ') or line.startswith('print') or line.startswith('if __name__'):
                break
            result.append(line)
        return '\n'.join(result).rstrip() + '\n'

    # For Java
    if suffix == '.java':
        if 'public static void main' in content:
            main_idx = content.find('public static void main')
            return content[:main_idx].rstrip() + '\n}\n'
        return content

    # For Go
    if suffix == '.go':
        if 'func main()' in content:
            main_idx = content.find('func main()')
            return content[:main_idx].rstrip() + '\n'
        return content

    # For Rust
    if suffix == '.rs':
        if 'fn main()' in content:
            main_idx = content.find('fn main()')
            return content[:main_idx].rstrip() + '\n'
        return content

    # For C/C++
    if suffix in ['.c', '.cpp', '.cc', '.cxx', '.h', '.hpp']:
        if 'int main' in content or 'void main' in content:
            patterns = [r'int\s+main\s*\(', r'void\s+main\s*\(']
            for pattern in patterns:
                match = re.search(pattern, content)
                if match:
                    return content[:match.start()].rstrip() + '\n'
        return content

    # For JavaScript/TypeScript
    if suffix in ['.js', '.ts', '.jsx', '.tsx']:
        lines = content.split('\n')
        result = []
        skip = False
        for line in lines:
            if any(x in line for x in ['const arr =', 'let arr =', 'var arr =', 'console.log', 'console.error']):
                skip = True
            if not skip:
                result.append(line)
        return '\n'.join(result).rstrip() + '\n'

    # For bash/shell
    if suffix in ['.sh', '.bash']:
        if 'shellsort "$@"' in content or 'shellsort() {' in content:
            lines = content.split('\n')
            in_func = False
            brace_count = 0
            result = []
            for line in lines:
                if 'shellsort()' in line and '{' in line:
                    in_func = True
                    brace_count = line.count('{') - line.count('}')
                    result.append(line)
                elif in_func:
                    brace_count += line.count('{') - line.count('}')
                    result.append(line)
                    if brace_count == 0:
                        break
                elif not in_func and line.strip() and not line.startswith('#'):
                    result.append(line)
            return '\n'.join(result).rstrip() + '\n'
        return content

    # For Lisp-family languages
    if suffix in ['.lisp', '.cl', '.scm', '.rkt', '.clj']:
        if '(shellsort ' in content or '(defn shellsort' in content or '(define (shellsort' in content:
            lines = content.split('\n')
            result = []
            paren_count = 0
            in_func = False
            for line in lines:
                if 'shellsort' in line and ('defun' in line or 'defn' in line or 'define' in line):
                    in_func = True
                    paren_count = line.count('(') - line.count(')')
                    result.append(line)
                elif in_func:
                    paren_count += line.count('(') - line.count(')')
                    result.append(line)
                    if paren_count == 0:
                        break
                elif '(' not in line and line.strip():
                    if not in_func:
                        result.append(line)
            return '\n'.join(result).rstrip() + '\n'
        return content

    # For Zig, D, and other C-like languages
    if suffix in ['.zig', '.d', '.nim', '.swift', '.kt', '.scala', '.rs', '.go']:
        patterns = [
            r'pub fn main\(',
            r'fn main\(',
            r'proc main\(',
            r'fun main\(',
            r'def main\(',
            r'func main\(',
        ]
        for pattern in patterns:
            match = re.search(pattern, content)
            if match:
                return content[:match.start()].rstrip() + '\n'
        return content

    # For Haskell
    if suffix == '.hs':
        if 'main =' in content or 'main :: ' in content:
            lines = content.split('\n')
            result = []
            for line in lines:
                if line.startswith('main'):
                    break
                result.append(line)
            return '\n'.join(result).rstrip() + '\n'
        return content

    # For Ada
    if suffix == '.adb':
        if 'begin' in content.lower():
            # Find the main procedure body
            lines = content.split('\n')
            for i, line in enumerate(lines):
                if 'begin' in line.lower():
                    result = lines[:i]
                    result.append(line)
                    return '\n'.join(result).rstrip() + '\n'
        return content

    # For Fortran
    if suffix == '.f90':
        if 'end program' in content.lower() or 'end subroutine' in content.lower():
            lines = content.split('\n')
            result = []
            for line in lines:
                result.append(line)
                if 'end subroutine' in line.lower():
                    break
            return '\n'.join(result).rstrip() + '\n'
        return content

    # Default: return as-is
    return content

def main():
    output_dir = Path('/Users/mhomsi/personal/code/1homsi/mergesort/shellsort')

    updated = 0
    for filepath in sorted(output_dir.glob('*')):
        if not filepath.is_file():
            continue

        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()

        cleaned = remove_test_code(filepath.name, content)

        if cleaned != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(cleaned)
            updated += 1

    print(f"Final cleanup: Updated {updated} files")

if __name__ == '__main__':
    main()
