import qualified System.IO
import qualified GHC.IO.Handle

filename = "test.txt"                                                                                                                                                                                                                                                      
main = do
      h <- System.IO.openFile filename System.IO.ReadMode
      old_stdin <- GHC.IO.Handle.hDuplicate System.IO.stdin
      GHC.IO.Handle.hDuplicateTo h System.IO.stdin
      System.IO.hClose h
      realMain
      GHC.IO.Handle.hDuplicateTo old_stdin System.IO.stdin

realMain = do
  x <- getLine
  print x
