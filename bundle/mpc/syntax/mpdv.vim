syntax region mpdArtist matchgroup=mpdArtistSyn start=/@ar/ end=/ar@/ concealends
syntax region mpdAlbum matchgroup=mpdAlbumSyn start=/@al/ end=/al@/ concealends
syntax region mpdTitle matchgroup=mpdTitleSyn start=/@ti/ end=/ti@/ concealends
highlight default mpdArtist ctermfg=darkgreen guifg=#5fff87
"highlight none mpdAlbum ctermfg=darkblue guifg=#5fd7ff
"highlight none mpdTitle ctermfg=darkmagenta guifg=#ffafff
